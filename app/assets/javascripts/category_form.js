$(function () {
  function appendOption(category) {
    let html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }

  function appendChidrenBox(insertHTML) {
    let childHtml = "";

    childHtml = `<div id = 'childrenWrapper'>
                   <select id="childrenCategory" name="good[category_id]">
                    <option value="">選択してください</option>
                    ${insertHTML}
                   </select>
                   <i class='fas fa-chevron-down'></i>
                 </div>`;
    $(".selectBoxCategory").append(childHtml);
  }

  function appendgrandChidrenBox(insertHTML) {
    let grandChildrenHtml = "";
    grandChildrenHtml = `<div id = 'grandChildrenWrapper'>
                          <select id="grandChildrenCategory" name="good[category_id]">
                            <option value="">選択してください</option>
                            ${insertHTML} 
                          </select>
                          <i class='fa fa-chevron-down'></i>
                         </div>`;
    $(".selectBoxCategory").append(grandChildrenHtml);
  }

  $(document).on("change", "#parentsCategory", function () {
    $("#childrenWrapper").remove();
    $("#grandChildrenWrapper").remove();
    let selectedCategory = document.getElementById("parentsCategory").value;
    if (selectedCategory != "") {
      $.ajax({
        url: "categoryChildren",
        type: "GET",
        data: {
          selectedCategory: selectedCategory,
        },
        dataType: "json",
      })
        .done(function (children) {
          let insertHTML = "";
          children.forEach(function (child) {
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function () {
          alert("カテゴリー取得に失敗しました");
        });
    }
  });

  $(document).on("change", "#childrenCategory", function () {
    $("#grandChildrenWrapper").remove();
    let selectedCategory = document.getElementById("childrenCategory").value;
    if (selectedCategory != "") {
      $.ajax({
        url: "categoryGrandChildren",
        type: "GET",
        data: {
          selectedCategory: selectedCategory,
        },
        dataType: "json",
      })
        .done(function (grandchildren) {
          let insertHTML = "";
          grandchildren.forEach(function (grandchild) {
            insertHTML += appendOption(grandchild);
          });
          appendgrandChidrenBox(insertHTML);
        })
        .fail(function () {
          alert("カテゴリー取得に失敗しました");
        });
    }
  });
});
