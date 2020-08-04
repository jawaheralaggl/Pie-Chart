//
//  ViewController.swift
//  pieChart
//
//  Created by Jawaher Alagel on 8/3/20.
//  Copyright © 2020 Jawaher Alaggl. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var piechart: PieChartView!
    
    @IBOutlet weak var aStepper: UIStepper!
    @IBOutlet weak var bStepper: UIStepper!
    @IBOutlet weak var cStepper: UIStepper!
    @IBOutlet weak var dStepper: UIStepper!
    
    var aDataEntry = PieChartDataEntry(value: 0)
    var bDataEntry = PieChartDataEntry(value: 0)
    var cDataEntry = PieChartDataEntry(value: 0)
    var dDataEntry = PieChartDataEntry(value: 0)
    
    var numberOfDataEntry = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aDataEntry.value = aStepper.value
        bDataEntry.value = bStepper.value
        cDataEntry.value = cStepper.value
        dDataEntry.value = dStepper.value
        
        numberOfDataEntry = [aDataEntry, bDataEntry, cDataEntry, dDataEntry]
        
        updatePieChart()
        reloadPieChart()
    }
    
    
    @IBAction func changeA(_ sender: UIStepper) {
        aDataEntry.value = sender.value
        updatePieChart()
    }
    @IBAction func changeB(_ sender: UIStepper) {
        bDataEntry.value = sender.value
        updatePieChart()
    }
    @IBAction func changeC(_ sender: UIStepper) {
        cDataEntry.value = sender.value
        updatePieChart()
    }
    @IBAction func changeD(_ sender: UIStepper) {
        dDataEntry.value = sender.value
        updatePieChart()
    }
    
    
    func updatePieChart() {
        let pieChartDataSet = PieChartDataSet(entries: numberOfDataEntry, label: nil)
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        
        let colors = [UIColor(named: "ColorA"), UIColor(named: "ColorB"), UIColor(named: "ColorC"), UIColor(named: "ColorD")]
        
        pieChartDataSet.drawValuesEnabled = false
        pieChartDataSet.colors = colors as! [NSUIColor]
        piechart.data = pieChartData
    }
    
    
    func reloadPieChart() {
        
        var dataEntries: [ChartDataEntry] = []
        let dataEntry: ChartDataEntry?
        let dataEntry2: ChartDataEntry?
        let dataEntry3: ChartDataEntry?
        let dataEntry4: ChartDataEntry?
        
        dataEntry = ChartDataEntry(x: 0, y: 20)
        dataEntry2 = ChartDataEntry(x: 0, y: 20)
        dataEntry3 = ChartDataEntry(x: 0, y: 20)
        dataEntry4 = ChartDataEntry(x: 0, y: 20)
        
        dataEntries.append(dataEntry!)
        dataEntries.append(dataEntry2!)
        dataEntries.append(dataEntry3!)
        dataEntries.append(dataEntry4!)
        
        let dataSet  = PieChartDataSet(entries: dataEntries, label: "")

        // dataSet.colors = ChartColorTemplates.pastel()
        let colors = [UIColor(named: "ColorA"), UIColor(named: "ColorB"), UIColor(named: "ColorC"), UIColor(named: "ColorD")]
        
        dataSet.drawValuesEnabled = false
        dataSet.colors = colors as! [NSUIColor]
        
        
        let pieChartData = PieChartData(dataSet: dataSet)
        piechart.usePercentValuesEnabled = true
        piechart.drawSlicesUnderHoleEnabled = false
        piechart.holeRadiusPercent = 0.85
        piechart.chartDescription?.enabled = false
        piechart.drawCenterTextEnabled = true
        piechart.drawEntryLabelsEnabled = false
        piechart.legend.enabled = false
        piechart.rotationAngle = -55
        piechart.maxAngle = 320;
        piechart.centerText = "Pie Chart"
        
        // let chartAttribute = [ NSAttributedString.Key.font: UIFont(name: "CustomFont", size: 24.0)! ]
        // let chartAttrString = NSAttributedString(string: "Pie Chart", attributes: chartAttribute)
        // piechart.centerAttributedText = chartAttrString
        
        piechart.delegate = self
        piechart.data = pieChartData
        
        piechart.animate(yAxisDuration: 1.3, easingOption: ChartEasingOption.easeOutBack)
        
        track()
    }
    
    
    func track() {
        let center = view.center
        
        let trackLayer = CAShapeLayer()
        let circlePath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        trackLayer.path = circlePath.cgPath
        
        trackLayer.strokeColor = UIColor.lightGray.withAlphaComponent(0.2).cgColor
        trackLayer.lineWidth = 15
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        
        view.layer.addSublayer(trackLayer)
        
        self.view.layer.insertSublayer(trackLayer, below: self.piechart.layer)
    }
    
    
    
}
