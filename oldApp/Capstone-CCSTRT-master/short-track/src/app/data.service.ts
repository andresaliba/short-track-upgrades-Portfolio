import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { Racer } from './racers.model';
import { User } from './users.model';

// import { ConsoleReporter } from 'jasmine';

@Injectable()
export class DataService {
  private http: HttpClient;

  //json that represents an admin's credentials
  public loginJSON = {
    username: '',
    password: ''
  };

  public racerForm: any;
  public users: User;
  public selectedUser: User;
  public racers: any;
  public racer: Racer;
  public children;
  public familyIDs: any[] = [];

  public loggedInType: string;
  public loggedInID: string = '';

  ///booleans
  //this variable reflects the state of the session
  public validLogin: boolean = true;
  public isLoggedIn: boolean;
  public racerLoggedIn: boolean;
  //this variable is for when a user is logged out to display a message
  public isLoggedOut: boolean;
  //this variable turns loading screens on or off
  public isLoaded: boolean = true;

  // this variable is how many nonAdults to charge for paypal
  public nonAdults: number = 0;
  public emptyPlates: number = 0;
  public kids: number = 0;
  public totalPrice: number;

  // Price per person for PayPal
  public racerCost: number;
  public plateFee: number = 5;

  public disableCSS: boolean = false;

  constructor(myHttp: HttpClient, private router: Router) {
    this.http = myHttp;

    this.getPayPalPrice();

    // First thing check if you are signed it, this is useful for when someone refreshes a page
    // this.checkSession();
  }

  //!! ----------------------------------------------------------------- FOR HOSTING ----------------------------------------------------------------- !!/

  //THIS IS TEMPORARY AND NOT THE BEST SOLUTION BUT PLEASE CHANGE THIS ACCORDING TO HOSTING :)
  public HOST: string = 'http://localhost:8081';

  public getRoute() {
    //console.log(this.router.url);
    return this.router.url;
  }

  // ----------------------------------------------------- SESSION MANAGEMENT METHODS

  //checks if a session is existing and logs that variable
  public checkSession(): void {
    this.http.get(this.HOST + '/login/session/get', { withCredentials: true }).subscribe(
      data => {
        // this.isLoggedIn = data['loggedIn'];
        // //console.log(data);
        // //console.log(this.isLoggedIn);
        if (data['type'] && data['username']) {
          this.isLoggedIn = true;
          this.loggedInType = data['type'];
          this.loggedInID = data['racerID'];

          this.getChildrenToPromise(data['racerID']);
        }
      },
      err => {
        //an error has occured so keep the user out
        //console.log(`>>>ERROR OCCURED IN RETRIEVING SESSION: ${err}`);
      }
    );
  }

  public redirectToLogin(): void {
    this.router.navigate(['login']);
  }

  public redirectToAdmin(): void {
    this.router.navigate(['admin/racers']);
  }

  public redirectToResults(): void {
    this.router.navigate(['/results']);
  }

  public getSession(): any {
    return this.http
      .get(this.HOST + '/login/session/get', { withCredentials: true })
      .toPromise()
      .then(data => {
        if (data['username']) {
          this.isLoggedIn = true;
        }
        return data;
      })
      .catch(err => {
        return Promise.reject(err);
      });
  }

  //destroys the session
  //only IF the user is logged in
  public destroySession(): void {
    this.getSession().then(result => {
      if (result['type'] && result['username']) {
        this.isLoaded = false;
        this.http.get(this.HOST + '/login/session/destroy', { withCredentials: true }).subscribe(
          data => {
            this.isLoggedOut = true;
            this.isLoggedIn = false;
            this.router.navigate(['login']);
            this.loggedInType = '';
            this.isLoaded = true;
          },
          err => {
            //console.log(`>>>ERROR OCCURED IN DESTROYING SESSION: ${err}`);
          }
        );
      }
    });
  }

  //post request that logs the user in
  public login(): void {
    this.isLoaded = false;
    if (
      (this.loginJSON.username != '' || this.loginJSON.username != null) &&
      (this.loginJSON.password != '' || this.loginJSON.username != null)
    ) {
      this.http.post(this.HOST + '/login/unlock', this.loginJSON, { withCredentials: true }).subscribe(
        (data: any) => {
          //console.log(data);
          this.validLogin = true;
          //reset all credentials
          this.loginJSON.username = '';
          this.loginJSON.password = '';
          //redirect the user to the admin page
          //will be double-checked by retrieving the session
          this.isLoaded = true;
          this.isLoggedIn = true;

          if (data.type == 'Admin' || data.type == 'Racer') {
            this.router.navigate(['admin/racers']);
          } else if (data.type == 'Volunteer') {
            this.router.navigate(['admin/racers-input']);
          }
        },
        err => {
          //console.log('>>>ERROR SENDING DATA: ' + err.error);
          this.validLogin = false;
          this.isLoggedIn = false;
        }
      );
    }
  }

  // ----------------------------------------------------- DATA METHODS

  public numberOfPayments() {
    this.nonAdults = 0;
    // check if any of the added racers are kids
    //console.log(this.children);
    this.children.forEach(child => {
      if (child.category != 'Adult') this.kids++;
    });

    // If the first racer is an adult and there are no kids added then charge them
    // If the first racer is a kid then charge them
    if ((this.racer.category == 'Adult' && this.kids == 0) || this.racer.category != 'Adult') {
      this.nonAdults++;
    }

    this.children.forEach(child => {
      // If its a kid add one to who needs to pay
      if (child.category != 'Adult') {
        this.nonAdults++;
      } else if (this.kids == 0) {
        // Otherwise if it's an adult and there are no kids add one to who needs to pay
        this.nonAdults++;
      }
    });

    //console.log('There are: ' + this.nonAdults + ' people that need to pay');
  }

  public getPayPalPrice(): void {
    this.http.get(this.HOST + '/admin/get/paypal', { withCredentials: true }).subscribe(
      data => {
        //console.log(data[0].price);
        this.racerCost = data[0].price;
      },
      err => {
        //console.log(err);
      }
    );
  }

  //simple retrieval of all racers
  public getRacers(): void {
    this.isLoaded = false;

    this.getSession().then(data => {
      if (data['username'] && data['type']) {
        this.http.get<Racer>(this.HOST + '/racers/get', { withCredentials: true }).subscribe(
          data => {
            this.racers = data;
            this.isLoaded = true;
          },
          err => {
            //console.log(err);
          }
        );
      }
    });
  }

  public editRacer(racer): void {
    this.getSession().then(data => {
      this.http.put<Racer>(this.HOST + '/racers/edit', racer, { withCredentials: true }).subscribe(
        data => {},
        err => {
          //console.log(err);
        }
      );
    });
  }

  public addResult(results): void {
    this.getSession().then(data => {
      if (data.type == 'Admin' || data.type == 'Volunteer') {
        this.http.post(this.HOST + '/racers/input', results, { withCredentials: true }).subscribe(
          data => {
            //console.log(data);
            this.getResults(data[1])
              .then(results => {
                let maleArray: Racer[] = [];
                let femaleArray: Racer[] = [];
                let xArray: Racer[] = [];

                results[0].forEach(racer => {
                  switch (racer.sex) {
                    case 'Male':
                      maleArray.push(racer);
                      break;
                    case 'Female':
                      femaleArray.push(racer);
                      break;
                    case 'X':
                      xArray.push(racer);
                  }
                });

                this.calculatePoints(maleArray, femaleArray, xArray);
              })
              .then(result => {
                //console.log(['male', result[0]]);
                //console.log(['female', result[1]]);
                //console.log(['x', result[2]]);
              })
              .catch(err => {});
          },
          err => {
            //console.log(err);
          }
        );
      }
    });
  }

  //! Move me
  public calculatePoints(maleRacers, femaleRacers, xRacers) {
    let racersArray = [maleRacers, femaleRacers, xRacers];

    racersArray.forEach(array => {
      this.addPoints(array, array.length);
    });
  }

  private addPoints(racers, length) {
    if (length >= 5) {
      for (let i = 0; i <= 4; i++) {
        switch (i) {
          case 0:
            //console.log('Add 5 points');
            //console.log(racers[i]);
            this.submitPoints(racers[i].plateNum, 5);
            break;
          case 1:
            //console.log('Add 4 points');
            //console.log(racers[i]);
            this.submitPoints(racers[i].plateNum, 4);
            break;

          case 2:
            //console.log('Add 3 points');
            //console.log(racers[i]);
            this.submitPoints(racers[i].plateNum, 3);
            break;

          case 3:
            //console.log('Add 2 points');
            //console.log(racers[i]);
            this.submitPoints(racers[i].plateNum, 2);
            break;

          case 4:
            //console.log('Add 1 points');
            //console.log(racers[i]);
            this.submitPoints(racers[i].plateNum, 1);
            break;
        }
      }
    } else if (length == 4) {
      for (let i = 0; i <= 3; i++) {
        switch (i) {
          case 0:
            //console.log('Add 4 points');
            //console.log(racers[i]);
            this.submitPoints(racers[i].plateNum, 4);
            break;
          case 1:
            //console.log('Add 3 points');
            //console.log(racers[i]);
            this.submitPoints(racers[i].plateNum, 3);
            break;
          case 2:
            //console.log('Add 2 points');
            //console.log(racers[i]);
            this.submitPoints(racers[i].plateNum, 2);
            break;
          case 3:
            //console.log('Add 1 points');
            //console.log(racers[i]);
            this.submitPoints(racers[i].plateNum, 1);
            break;
        }
      }
    } else if (length == 3) {
      for (let i = 0; i <= 2; i++) {
        switch (i) {
          case 0:
            //console.log('Add 3 points');
            //console.log(racers[i]);
            this.submitPoints(racers[i].plateNum, 3);
            break;
          case 1:
            //console.log('Add 2 points');
            //console.log(racers[i]);
            this.submitPoints(racers[i].plateNum, 2);
            break;
          case 2:
            //console.log('Add 1 points');
            //console.log(racers[i]);
            this.submitPoints(racers[i].plateNum, 1);
            break;
        }
      }
    } else if (length == 2) {
      for (let i = 0; i <= 1; i++) {
        switch (i) {
          case 0:
            //console.log('Add 2 points');
            //console.log(racers[i]);
            this.submitPoints(racers[i].plateNum, 2);

            break;
          case 1:
            //console.log('Add 1 points');
            //console.log(racers[i]);
            this.submitPoints(racers[i].plateNum, 1);

            break;
        }
      }
    } else if (length == 1) {
      //console.log('Add 1 point');
      this.submitPoints(racers[0].plateNum, 1);
      //console.log(racers[0].plateNum);
    }
  }

  public submitPoints(plate: number, points: number) {
    let pointsObject = { plate: plate, points: points };
    //console.log(pointsObject);
    return this.http
      .post(this.HOST + '/admin/addpoints', pointsObject, { withCredentials: true })
      .toPromise()
      .then(data => {
        //console.log(data);
        return true;
      })
      .catch(err => {
        //console.log('>>>ERROR ADDING POINTS: ' + err.error);
        return Promise.reject(err);
      });
  }

  public getRacer(id: Number): any {
    return this.http
      .get<Racer>(this.HOST + `/racers/get/${id}`, { withCredentials: true })
      .toPromise()
      .then(data => {
        this.racer = data;
        this.familyIDs.push(this.racer.id);
        return data;
      })
      .catch(err => {
        return Promise.reject(err);
      });
  }

  public getRacerByPoints(): any {
    return this.http
      .get<Racer>(this.HOST + `/racers/get/points`, { withCredentials: true })
      .toPromise()
      .then(data => {
        this.racers = data;
        //console.log(data);
        return data;
      })
      .catch(err => {
        return Promise.reject(err);
      });
  }

  public getRacerByPlate(plateNum: Number): any {
    return this.http
      .get<Racer>(this.HOST + `/racers/get/plate/${plateNum}`, { withCredentials: true })
      .toPromise()
      .then(data => {
        return data;
      })
      .catch(err => {
        return Promise.reject(err);
      });
  }

  // Used for signup validation
  public checkRacerByPlate(plateNum: Number): any {
    return this.http
      .get<Racer>(this.HOST + `/racers/get/plate/check/${plateNum}`, { withCredentials: true })
      .toPromise()
      .then(data => {
        return data;
      })
      .catch(err => {
        return Promise.reject(err);
      });
  }

  // Used for signup validation
  public checkUserByName(userName: string): any {
    return this.http
      .get<User>(this.HOST + `/users/get/check/${userName}`, { withCredentials: true })
      .toPromise()
      .then(data => {
        return data;
      })
      .catch(err => {
        return Promise.reject(err);
      });
  }

  public getAllResults(): any {
    return this.http
      .get(this.HOST + `/results/get/`, { withCredentials: true })
      .toPromise()
      .then(data => {
        return data;
      })
      .catch(err => {
        return Promise.reject(err);
      });
  }

  public getResults(id: Number): any {
    return this.http
      .get(this.HOST + `/results/get/${id}`, { withCredentials: true })
      .toPromise()
      .then(data => {
        let plateDictionary = {};
        data[0].forEach(racer => {
          plateDictionary[racer.plateNum] = racer;
        });

        let orderedRacers = [];
        data[1].forEach(plateNumber => {
          orderedRacers.push(plateDictionary[plateNumber]);
        });

        return [orderedRacers, data[2]];
      })
      .catch(err => {
        return Promise.reject(err);
      });
  }

  public getPromiseReq(request: string): any {
    return this.http
      .get(this.HOST + request, { withCredentials: true })
      .toPromise()
      .then(data => {
        return data;
      })
      .catch(err => {
        return Promise.reject(err);
      });
  }

  public getChildren(id: Number): void {
    this.http.get<Racer>(this.HOST + `/racers/get/children/${id}`, { withCredentials: true }).subscribe(
      data => {
        ``;
        this.children = data;
        //console.log(this.children);
      },
      err => {
        //console.log(err);
      }
    );
  }

  public deleteResults(id: Number) {
    return this.http
      .delete(this.HOST + `/results/delete/${id}`, { withCredentials: true })
      .toPromise()
      .then(data => {
        return data;
      })
      .catch(err => {
        return Promise.reject(err);
      });
  }

  public getChildrenToPromise(id: Number) {
    return this.http
      .get<Racer>(this.HOST + `/racers/get/children/${id}`, { withCredentials: true })
      .toPromise()
      .then(data => {
        this.children = data;
        this.children.forEach(child => {
          this.familyIDs.push(child.id);
        });
        return data;
      })
      .catch(err => {
        return Promise.reject(err);
      });
  }

  // Get all users who are Racer type
  public getRacerUsers(userName: string): any {
    return this.http
      .get<User>(this.HOST + `/racers/users/get/${userName}`, { withCredentials: true })
      .toPromise()
      .then(data => {
        // this.users = data;
        this.selectedUser = data;
        //console.log(this.selectedUser);
        return data;
      })
      .catch(err => {
        return Promise.reject(err);
      });
  }

  //post request to add a racer
  public addRacer(racer): void {
    this.http.post(this.HOST + '/racers/add', racer, { withCredentials: true }).subscribe(
      data => {
        //console.log(data);
      },
      err => {
        //console.log('>>>ERROR SUBMITTING RACER: ' + err.error);
      }
    );
  }

  public deleteRacer(id: Number) {
    this.http.delete(this.HOST + `/racers/${id}/delete`, { withCredentials: true }).subscribe(
      data => {},
      err => {
        //console.log('>>>ERROR DELETING RACER: ' + err.error);
      }
    );
  }

  public checkIn(ids): void {
    this.http.post(this.HOST + '/racers/checkin', ids, { withCredentials: true }).subscribe(
      data => {
        //console.log(data);
      },
      err => {
        //console.log('>>>ERROR CHECKING IN: ' + err.error);
      }
    );
  }

  // Post request to reset all the attendance back to no
  public resetAttendance(value): void {
    this.http.post(this.HOST + '/racers/resetAttend', value, { withCredentials: true }).subscribe(
      data => {
        //console.log(data);
      },
      err => {
        //console.log('>>>ERROR RESETTING ATTENDANCE: ' + err.error);
      }
    );
  }

  // Post request to reset all the attendance back to no
  public resetAttendedStatus(value): void {
    this.http.post(this.HOST + '/racers/resetAttendedStatus', value, { withCredentials: true }).subscribe(
      data => {
        //console.log(data);
      },
      err => {
        //console.log('>>>ERROR RESETTING ATTENDED STATUS: ' + err.error);
      }
    );
  }

  // Post request to reset all the attendance back to no
  public resetTotalPoints(value): void {
    this.http.post(this.HOST + '/racers/resetTotalPoints', value, { withCredentials: true }).subscribe(
      data => {
        //console.log(data);
      },
      err => {
        //console.log('>>>ERROR RESETTING TOTAL POINTS: ' + err.error);
      }
    );
  }

  // Post request to reset all payments back to no
  public resetPaid(value): void {
    this.http.post(this.HOST + '/racers/resetPaid', value, { withCredentials: true }).subscribe(
      data => {},
      err => {
        //console.log('>>>ERROR RESETTING PAID: ' + err.error);
      }
    );
  }

  public setPaid(): void {
    //console.log(this.familyIDs);
    this.http.post(this.HOST + '/admin/setPaid', this.familyIDs, { withCredentials: true }).subscribe(
      data => {},
      err => {
        //console.log('>>>ERROR SETTING PAID: ' + err.error);
      }
    );
  }

  // Post request to reset all payments back to no
  public newAdmin(value): void {
    this.http.post(this.HOST + '/admin/newadmin', value, { withCredentials: true }).subscribe(
      data => {
        //console.log(data);
      },
      err => {
        //console.log('>>>ERROR CREATING ADMIN: ' + err.error);
      }
    );
  }

  // Update the admission cost
  public editPayPalPrice(newPrice): void {
    let price = { myPrice: newPrice, oldPrice: this.racerCost };
    //console.log(price);
    this.http.post(this.HOST + '/admin/paypal', price, { withCredentials: true }).subscribe(
      data => {
        //console.log(data);
        this.racerCost = newPrice;
      },
      err => {
        //console.log('>>>ERROR CHANGING PAYPAL PRICE: ' + err.error);
      }
    );
  }

  //post request to reset Racer passwords
  public resetRacerPass(newPass): any {
    const myInfo = { user: this.selectedUser.username, password: newPass };

    this.http.post(this.HOST + '/admin/resetpass', myInfo, { withCredentials: true }).subscribe(
      data => {
        //console.log(data);
        return true;
      },
      err => {
        //console.log('>>>ERROR CHANGING PASSWORD: ' + err.error);
        return false;
      }
    );
  }
}
