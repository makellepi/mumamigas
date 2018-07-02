document.addEventListener("turbolinks:load", function(){
  var country = document.getElementById("country");
  var state = document.getElementById("state");

  CS.update
  country.addEventListener("change", function(){
    console.log('change country, update state')
    Rails.ajax({
      url: "/states?country=" + country.value,
      type: "GET"
    })
  })

  state.addEventListener("change", function(){
    Rails.ajax({
      url: "/cities?country=" + country.value + "&state=" + state.value,
      type: "GET"
    })
  })
})
