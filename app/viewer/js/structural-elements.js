//CODE FOR CUSTOM FORM//
$(document).ready(function () {
  // Add a click event handler to the #addAnnotationBtn button
  $("#addElementBtn").click(function () {
    // Display the type selection panel
    structuralElementPanel = document.getElementById(
      "structural-element-panel"
    );
    // Check if the panel is currently open in the viewer
    if (structuralElementPanel.style.display === "flex") {
      // Hide the panel
      structuralElementPanel.style.display = "none";
    } else {
      // Make the panel visible
      structuralElementPanel.style.display = "flex";
    }
  });
});

/**
 * Add a click event handler to the #pickPointButton button to pick a point in the Potree viewer.
 *
 * The handler initiates the measuring tool to pick a single point and updates the input box with the selected point's coordinates.
 *
 * @listens click
 * @throws {Error} Will throw an error if there's an issue initiating the measuring tool or updating the input box.
 */
document.addEventListener("DOMContentLoaded", function () {
  $("#pickElButton").click(function () {
    const measurement = window.viewer.measuringTool.startInsertion({
      showDistances: false,
      showAngles: false,
      showCoordinates: true,
      showArea: false,
      closed: true,
      maxMarkers: 1,
      name: "Point",
    });
    // Listen for the marker_dropped event
    measurement.addEventListener("marker_dropped", (e) => {
      // Get the coordinates of the picked point
      const scalarfield = e.measurement.points[0].classification[0];

      // Update the input box for the position with the selected point
      $("#elpos").val(scalarfield);

      // Remove the measurement from the scene
      viewer.scene.removeMeasurement(measurement);
    });
  });
});

// Add a click event handler to the #addNewElement button
// Wait for the viewer to be ready
document.addEventListener("DOMContentLoaded", function () {
  $("#addNewElement").click(function () {
    // Get values from the form fields
    let elementType = $("#elementTypeDropdown").val();
    let material = $("#materialDropdown").val();
    let scalarField = $("#elpos").val();

    // Save the element with the values from the form
    saveStructuralElement(
      elementType,
      material,
      scalarField
    );

    // Hide the custom form panel
    structuralElForm = document.getElementById("structural-element-panel");
    structuralElForm.style.display = "none";
    newElButton = document.getElementById("pickElButton");
    newElButton.style.display = "none";
  });
});

function saveStructuralElement(elementType, material, scalarField){
    console.log("Scalar field: " + scalarField);
    // Use AJAX to send data to the PHP script for insertion
    $.ajax({
      type: "POST",
      url: "database/insert_structural_element.php",
      data: {
        elementType: elementType,
        material: material,
        scalarField: scalarField,
      },
      success: function (id) {
        console.log(`${elementType} structural element created with ID: ${id}`);
      },
      error: function (error) {
        console.error(`Error saving ${elementType} annotation:`, error);
      },
    });
  }

//Showing structural elements panel//
$(document).ready(function () {
  // Add a click event handler to the #elements_icon button
  $("#elements_icon").click(function () {
    console.log("You clicked the structural element icon!")
    // Display the elements panel
    elementsPanel = document.getElementById("elements_panel");
    // Check if the panel is currently open in the viewer
    if (elementsPanel.style.display === "flex") {
      // Hide the panel
      elementsPanel.style.display = "none";
    } else {
      // Make the panel visible
      elementsPanel.style.display = "flex";
      listStructuralElements();
    }
  });
});

/**
 * Defining listStructuralElements() function
 * 
 * @throws {Error} Will throw an error if there's an issue initiating the measuring tool or updating the input box.
 */
function listStructuralElements(){
  $.ajax({
    type: "GET",
    url: "database/load_structuralelements.php",
    dataType: "json",
    success: function (elementGroups) {
      // Assuming scene is available globally, adjust if needed
      let scene = viewer.scene;

      // Creating entry in elements panel for each distinct group
      console.log(elementGroups); // For debugging purposes
      const elementsList = document.getElementById("elements_list");
      elementsList.innerHTML = ''; // Clear existing list items
      const listTitle = document.createElement("div");
      listTitle.innerHTML = '<b>Select element type:</b>';
      elementsList.appendChild(listTitle);

      elementGroups.forEach(group => {
        const listItem = document.createElement("li");
        const div = document.createElement("div");
        div.id = `legend-${group.name.toLowerCase().replace(/\s+/g, '-')}`;
        div.style.color = group.color || 'white'; // Use group color or default to white
        div.textContent = group.count + ' ' + group.name + '(s)';
        listItem.appendChild(div);
        elementsList.appendChild(listItem);
        // Add click event listener to each div
        div.addEventListener('click', function() {
          searchElementGroup(group.name);
        });
      });
    },
    error: function (error) {
      console.error("Error loading existing elements:", error);
    },
  });
}

/**
     * Defining searchElementGroup() function
     * 
     * @param {string} groupName - The name of the group to search for in the database
     */
function searchElementGroup(groupName) {
  console.log(`Searching for group: ${groupName}`);

  $.ajax({
    type: "GET",
    url: "database/search_elementgroup.php",
    data: { group: groupName },
    dataType: "json",
    success: function (results) {
      console.log(`Results for ${groupName}:`, results);
      // Handle the results of the search here
    },
    error: function (error) {
      console.error(`Error searching for group ${groupName}:`, error);
    }
  });
}

