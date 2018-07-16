const input = document.getElementById('user_email1')

const webKitCheck = () => {
  const webKit = document.querySelectorAll('input:-webkit-autofill')
  webKit.forEach((element) => {
    element.previousSibling.classList.add('active', 'highlight')
  });
}
window.setTimeout(webKitCheck, 100);
