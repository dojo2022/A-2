'use strict'

function goSubmit(formObj, btnObj) {
formObj.action.value=btnObj.name;
formObj.submit();
}