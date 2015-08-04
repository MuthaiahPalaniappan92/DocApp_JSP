/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var app=angular.module('cricketCorridor',[]);

app.controller('headerController',function(){
   this.links=linksArray; 
});

var linksArray=[
    {
        title:'Home',
        linkRef:'home.jsp'
    },
    {
        title:'Sign Up',
        linkRef:'signup.jsp'
    },
    {
        title:'Login',
        linkRef:'login.jsp'
    },
    {
        title:'New Forum',
        linkRef:'nforum.jsp'
    },
    {
        title:'Existing Forum',
        linkRef:'eforum.jsp'
    },
    {
        title:'Log Out',
        linkRef:'login.jsp'
    }
];
