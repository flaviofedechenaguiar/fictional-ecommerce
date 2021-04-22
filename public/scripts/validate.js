
function validate(tag) {
    if (tag.value == '') {
        tag.className = 'form-control is-invalid';
    } else {
        tag.className = 'form-control is-valid'
    }
}
