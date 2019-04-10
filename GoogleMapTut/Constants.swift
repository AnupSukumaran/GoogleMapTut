//
//  Constants.swift
//  Loqqat
//
//  Created by Sukumar Anup Sukumaran on 20/03/19.
//  Copyright © 2019 Qaptive_Technologies. All rights reserved.
//

import Foundation


struct Constants {
    
    struct ApiBase {
        
        static let APIScheme = "http"
        static let APIHost = "qaptive.co.in"
        static let APIPath = "/loqqat_v2/api"
        
    }
    
    struct ViewKeys {
        //cell keys
        static let countryCell = "CountryCell"
        static let studentCell = "StudentCell"
        static let homeCell = "HomeTableViewCell"
        
        //storyBor
        static let homeVC = "HomeViewController"
        static let leftMenuVC = "LeftMenuViewController"
        static let loginVC = "LoginViewController"
        static let otpVC = "OTPViewController"
        static let mapVC  = "MapViewController"
        static let timeVC  = "TimeAndContactViewController"
        static let setBoardVC = "SetBoardViewController"
        
    }
    
    struct Keys {
        
        //Google Api key
        static let googleMapAPIKey = "AIzaSyCucBX-zzVBw1bDxoJSj0549KwCP2IUa8o"
        
        //User Default
        static let userSession = "userSession"
        static let authID = "authID"
        
        //Login
        static let mobile = "mobile"
        
        //CountryModel
        static let data = "data"
        static let message = "message"
        static let id = "id"
        static let name = "name"
        static let code = "code"
        static let flag = "flag"
        static let status = "status"
        static let countries = "countries"
        
        //StudentsModel
        static let students = "students"
        static let student_id = "student_id"
        static let profile_pic = "profile_pic"
        static let studentClass = "class"
        static let school = "school"
        static let gender = "gender"
        static let pick = "pick"
        static let drop = "drop"
        static let latitude = "latitude"
        static let longitude = "longitude"
        static let location = "location"
        
        //APIStatus
        static let success = "200"
        static let failed = "404"
        
        //Header keys
        static let ls = "ls"
        
        //Ward list
        static let parent_id = "parent_id"
        
        //Image names
        static let home = "home"
        static let cancel = "cancel"
        static let bus = "bus"
        
        //OTP
        static let parentInfo = "parentInfo"
        static let auth_token = "auth_token"
        static let parent_name = "parent_name"
        static let device_info = "device_info"
        static let otp = "otp"
        
        //TimeLine API
        static let timeline = "timeline"
        static let time = "time"
        static let trip_type = "trip_type"
        static let event = "event"
        
        static let picked = "Pick"
        static let dropped = "Drop"
        
        //Contact Details API
        static let contact_details = "contact_details"
        static let conductor_name = "conductor_name"
        static let conductor_contact = "conductor_contact"
        static let school_contact = "school_contact"
        static let bus_number = "bus_number"
        
        //Update boardng point
        static let boarding_point = "boarding_point"
        static let drop_point = "drop_point"
        
        //get Current Location
        static let locations = "locations"
        static let current_loc = "current_loc"
        static let boarding_loc = "boarding_loc"
        static let dropping_loc = "dropping_loc"
        //theme key
        static let themeKey = "themekey"
        
        //Notification
        static let device_token = "device_token"
        static let type = "type"
        
        static let device_OS = "ios"
    }
    
    struct  Texts {
        
        static let defaultErrorMsg = "Something went wrong. Please Try again!!"
        static let mobileNumEmpty = "Please enter your mobile Number"
        static let ok = "OK"
        static let message = "Message"
        
        //Menu Title
        static let home = "Home"
        static let change_Theme = "Change Theme"
        static let update_boarding_point = "Update boarding point"
        static let logout = "Logout"
        static let locAccTitle = "This application requires location services to work. Do you want to enable location from settings?"
        static let locNotFound = "Location not found!!.Please try again"
    }
    
    struct PathExt {
        static let getLoginOtp = "/getLoginOtp"
        static let getcountries = "/getcountries"
        static let getWardList = "/getWardList"
        static let verifyParentOtp = "/verifyParentOtp"
        static let getTimeline = "/getTimeline"
        static let getContactDetails = "/getContactDetails"
        static let updateBoardingPoint = "/updateBoardingPoint"
        static let getStudCurrentLoc = "/getStudCurrentLoc"
        static let logOutParent = "/logOutParent"
        static let updateParentDeviceInfo = "/updateParentDeviceInfo"
    }
    
}
