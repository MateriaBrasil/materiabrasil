describe("Materials.Show", function(){
  var app;
  var indicator; 
  beforeEach(function(){
    indicator = $("<html><body><div class='indicators'><ol><li class='indicator'></li></ol><ul class='children'></ul></ol></div></body></html>")[0]; 
    app = new App.Materials.Show({ 
      el: indicator
    });
  });

  describe("#initialize", function(){
    beforeEach(function(){
      spyOn(app, "initialize").andCallThrough();;
      spyOn(app, "showChildrenList")

      app.initialize();
    });
    it("Should show an initial indicator as highlighted", function(){
      expect(app.initialize).toHaveBeenCalled();
    });

    it("Should show default children list", function(){
      expect(app.showChildrenList).toHaveBeenCalled();
    });
  });


  describe("#activateIndicator", function(){
    beforeEach(function(){
      spyOn(app, "activateIndicator").andCallThrough();
      spyOn(app, "showChildrenList");
      app.delegateEvents();

      tgt = $(indicator).find('li.indicator').click();
    });

    it("Should get current target and show children list for that indicator", function(){
      expect(app.activateIndicator).toHaveBeenCalled();
      expect(app.showChildrenList).toHaveBeenCalled();
    });
  });

  describe("#showChildrenList", function(){
    beforeEach(function(){
     spyOn($.fn, "hide");
     spyOn($.fn, "removeClass");
     spyOn($.fn, "addClass");
     spyOn($.fn, "fadeIn");
     spyOn(app, "showChildrenList").andCallThrough();
     app.showChildrenList($(indicator).find('li.indicator'));
    });

    it ("Should show the children list of the given indicator", function(){
      expect(app.showChildrenList).toHaveBeenCalledWith(jasmine.any(Object));
      expect($.fn.hide).toHaveBeenCalled();
      expect($.fn.removeClass).toHaveBeenCalled();
      expect($.fn.addClass).toHaveBeenCalled();
      expect($.fn.fadeIn).toHaveBeenCalled();
    });
  });
});
