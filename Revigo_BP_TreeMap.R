# A treemap R script produced by the Revigo server at http://revigo.irb.hr/
# If you found Revigo useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM

# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary

# --------------------------------------------------------------------------
# Here is your data from Revigo. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency","value","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0001816","cytokine production",0.10653209980375666,6.503070351926785,0.9775033296537874,-0,"cytokine production"),
c("GO:0001775","cell activation",4.093075413512755,1.948160793125999,0.9873630325927693,0.12026377,"cytokine production"),
c("GO:0032608","interferon-beta production",0.022427810485001393,3.2554527747218294,0.9482832429139492,0.22713096,"cytokine production"),
c("GO:0032774","RNA biosynthetic process",3.0670030838239417,1.5266644535765994,0.9758599304932832,0.29765394,"cytokine production"),
c("GO:0001817","regulation of cytokine production",4.350995234090272,6.562249437179612,0.8576003602347875,0.04115949,"regulation of cytokine production"),
c("GO:0010604","positive regulation of macromolecule metabolic process",19.01878329128119,5.213248577854439,0.7736095219103178,0.49115017,"regulation of cytokine production"),
c("GO:0032648","regulation of interferon-beta production",0.3252032520325203,3.2554527747218294,0.8676456827612814,0.33912804,"regulation of cytokine production"),
c("GO:0034344","regulation of type III interferon production",0.022427810485001403,2.696267347949662,0.9021402673161308,0.42436503,"regulation of cytokine production"),
c("GO:0048522","positive regulation of cellular process",32.01009251471825,7.503070351926785,0.8291682233215846,0.14406819,"regulation of cytokine production"),
c("GO:0051090","regulation of DNA-binding transcription factor activity",1.8951499859826186,2.9919622203704646,0.8660289493549613,0.26298532,"regulation of cytokine production"),
c("GO:0051246","regulation of protein metabolic process",11.729744883655734,1.6818746780997695,0.8572117407424166,0.39620219,"regulation of cytokine production"),
c("GO:0051252","regulation of RNA metabolic process",20.930754135127557,2.484904744052379,0.8242792983942263,0.48258596,"regulation of cytokine production"),
c("GO:0060255","regulation of macromolecule metabolic process",33.5520044855621,4.284832642151542,0.8313720172154084,0.30324314,"regulation of cytokine production"),
c("GO:1903320","regulation of protein modification by small protein conjugation or removal",1.3568825343425848,1.5571497649010047,0.8973031068651923,0.19520802,"regulation of cytokine production"),
c("GO:2000627","positive regulation of miRNA catabolic process",0.022427810485001403,2.1549597249932946,0.8910949922926948,0.12579293,"regulation of cytokine production"),
c("GO:0001906","cell killing",0.768152509111298,1.9033304442286525,0.9963641504767415,0.00705354,"cell killing"),
c("GO:0002376","immune system process",13.036164844407065,25.661543506395397,1,-0,"immune system process"),
c("GO:0002682","regulation of immune system process",8.701990468180544,17.869666231504993,0.9413093278412337,0.05044672,"regulation of immune system process"),
c("GO:0007154","cell communication",29.739276703111862,3.510978582966549,0.9938751639706367,0.01430562,"cell communication"),
c("GO:0008219","cell death",6.128399215026633,5.119186407719209,0.9952861840622236,0.00947634,"cell death"),
c("GO:0010646","regulation of cell communication",19.416876927389964,5.723538195826756,0.9232491283192915,0.08981386,"regulation of cell communication"),
c("GO:0016032","viral process",1.407345107933838,6.886056647693163,1,-0,"viral process"),
c("GO:0019079","viral genome replication",0.10653209980375666,7.614393726401688,0.993879781428563,-0,"viral genome replication"),
c("GO:0019835","cytolysis",0.03924866834875246,1.9522195810217304,0.9972484317690755,0.00390081,"cytolysis"),
c("GO:0023051","regulation of signaling",19.37762825904121,6.36251027048749,0.9305872256980529,0.08975588,"regulation of signaling"),
c("GO:0030097","hemopoiesis",3.8631903560414913,2.675733393652684,0.9955800523675407,0.00567362,"hemopoiesis"),
c("GO:0034097","response to cytokine",4.681805438744043,32.213248577854436,0.8343694082507445,0,"response to cytokine"),
c("GO:0002440","production of molecular mediator of immune response",0.29716848892626857,2.8847430580657676,0.8888474938902208,0.395506,"response to cytokine"),
c("GO:0002456","T cell mediated immunity",0.24109896271376505,2.5199407147695676,0.8610592001457702,0.46719822,"response to cytokine"),
c("GO:0006950","response to stress",19.259882253994952,21.82102305270683,0.8977095253213957,0.2264125,"response to cytokine"),
c("GO:0006952","defense response",8.102046537706755,31.282329496997736,0.8860188111014922,0.47040712,"response to cytokine"),
c("GO:0007166","cell surface receptor signaling pathway",11.858704793944492,9.279840696594043,0.8083536751953734,0.28470337,"response to cytokine"),
c("GO:0007249","canonical NF-kappaB signal transduction",0.3083823941687692,7.8696662315049934,0.8756453095157709,0.18421215,"response to cytokine"),
c("GO:0009597","detection of virus",0.0336417157275021,2.3966177511470113,0.8805516338904209,0.42380572,"response to cytokine"),
c("GO:0009605","response to external stimulus",12.907204934118308,22.950781977329818,0.9046641366698641,0.18291993,"response to cytokine"),
c("GO:0009607","response to biotic stimulus",8.00112139052425,35.350665141287855,0.9117925996139633,0.1497184,"response to cytokine"),
c("GO:0010033","response to organic substance",13.843566021867115,19.647817481888637,0.8348972386624306,0.48340761,"response to cytokine"),
c("GO:0030522","intracellular receptor signaling pathway",1.0485001401738157,9.115204636051018,0.8634766034016387,0.10978546,"response to cytokine"),
c("GO:0035556","intracellular signal transduction",8.584244463134286,2.866603218592592,0.818298191553862,0.41519444,"response to cytokine"),
c("GO:0038061","non-canonical NF-kappaB signal transduction",0.18502943650126155,5.0655015487564325,0.8816261526571534,0.48359592,"response to cytokine"),
c("GO:0042221","response to chemical",21.283992150266332,13.220403508742175,0.8958082964982625,0.26186393,"response to cytokine"),
c("GO:0043331","response to dsRNA",0.31959629941127,1.8265606612035705,0.8760804759723037,0.46985151,"response to cytokine"),
c("GO:0045087","innate immune response",4.322960470984021,27.67778070526608,0.7275777638301705,0.13485832,"response to cytokine"),
c("GO:0050900","leukocyte migration",1.373703392206336,5.33161408331,0.8687721441808448,0.47701298,"response to cytokine"),
c("GO:0051715","cytolysis in another organism",0.0336417157275021,2.3966177511470113,0.9382593116728335,0.40000393,"response to cytokine"),
c("GO:0051716","cellular response to stimulus",36.34426689094477,5,0.88219459756675,0.32683624,"response to cytokine"),
c("GO:0070269","pyroptosis",0.17942248388001122,1.392996695589738,0.9795187467753778,0.46153456,"response to cytokine"),
c("GO:0071359","cellular response to dsRNA",0.12895991028875806,2.0696459982254116,0.867190810952431,0.35072149,"response to cytokine"),
c("GO:0097191","extrinsic apoptotic signaling pathway",0.63919259882254,3.816138210717992,0.84173118707647,0.19818285,"response to cytokine"),
c("GO:0040011","locomotion",2.1362489486963834,2.482215101984288,1,-0,"locomotion"),
c("GO:0043067","regulation of programmed cell death",8.505747126436782,4.314258261397736,0.9353181578751095,0.06081267,"regulation of programmed cell death"),
c("GO:0044419","biological process involved in interspecies interaction between organisms",8.713204373423045,34.65955588515988,1,-0,"biological process involved in interspecies interaction between organisms"),
c("GO:0045088","regulation of innate immune response",2.472666105971405,19.03058408764602,0.6782665269365322,-0,"regulation of innate immune response"),
c("GO:0001959","regulation of cytokine-mediated signaling pathway",0.9139332772638071,5.34008379993015,0.835873177571993,0.33236828,"regulation of innate immune response"),
c("GO:0002831","regulation of response to biotic stimulus",2.949257078777684,20.744727494896694,0.836890220870586,0.32052645,"regulation of innate immune response"),
c("GO:0032101","regulation of response to external stimulus",6.229324362209139,15.651695136951838,0.8191980258012657,0.36753911,"regulation of innate immune response"),
c("GO:0043122","regulation of canonical NF-kappaB signal transduction",1.586767591813849,6.281498311132726,0.828357652179767,0.29519546,"regulation of innate immune response"),
c("GO:0043123","positive regulation of canonical NF-kappaB signal transduction",1.2111017661900756,3.1072827982527147,0.7831848634903383,0.48250674,"regulation of innate immune response"),
c("GO:0048584","positive regulation of response to stimulus",12.604429492570787,12.399027104313252,0.7609169448131341,0.47767859,"regulation of innate immune response"),
c("GO:0060759","regulation of response to cytokine stimulus",0.975609756097561,7.595166283380062,0.8573702197252696,0.27795835,"regulation of innate immune response"),
c("GO:0080134","regulation of response to stress",7.720773759461733,10.987162775294827,0.813355989039852,0.49981239,"regulation of innate immune response"),
c("GO:0140639","positive regulation of pyroptosis",0.02803476310625175,2.696267347949662,0.9227520054712923,0.34855727,"regulation of innate immune response"),
c("GO:1901222","regulation of non-canonical NF-kappaB signal transduction",0.5663022147462854,2.106306188435172,0.8471520938876167,0.44314099,"regulation of innate immune response"),
c("GO:2001236","regulation of extrinsic apoptotic signaling pathway",0.8578637510513036,2.999687854470387,0.8337850182374891,0.33000441,"regulation of innate immune response"),
c("GO:0048525","negative regulation of viral process",0.5158396411550322,10.623423042943488,0.9282963848874696,0.03137172,"negative regulation of viral process"),
c("GO:0048523","negative regulation of cellular process",27.37874964956546,3.05419425357872,0.8941009871893727,0.26541506,"negative regulation of viral process"),
c("GO:0048583","regulation of response to stimulus",22.467059153350156,9.563837352959244,0.9281030241012374,0.07149402,"regulation of response to stimulus"),
c("GO:0019222","regulation of metabolic process",36.46761984861228,3.028364244324552,0.9183312775322875,0.19140425,"regulation of response to stimulus"),
c("GO:0023052","signaling",28.8758059994393,4.236572006437063,0.9233934212460726,0.12247676,"regulation of response to stimulus"),
c("GO:0048518","positive regulation of biological process",34.83038968320717,7.047691990337875,0.9193870439118769,0.11041301,"regulation of response to stimulus"),
c("GO:0048519","negative regulation of biological process",29.217830109335573,4.182434630440219,0.9231551131047525,0.12310789,"regulation of response to stimulus"),
c("GO:0050789","regulation of biological process",66.06672273619289,2.817357417052459,0.9141800883431584,0.27645776,"regulation of response to stimulus"),
c("GO:0050794","regulation of cellular process",63.06700308382395,3.9238148394009205,0.9028614282600019,0.18560342,"regulation of response to stimulus"),
c("GO:0048870","cell motility",6.173254835996636,2.0906040259986276,0.9952812097343975,0.01433172,"cell motility"),
c("GO:0050792","regulation of viral process",0.9363610877488086,8.928117992693874,0.9584335039915497,0.03360615,"regulation of viral process"),
c("GO:0050896","response to stimulus",46.05550883095037,10.27083521030723,1,-0,"response to stimulus"),
c("GO:0051239","regulation of multicellular organismal process",16.523689374824784,1.9317741627298621,0.9330571430382103,0.0854139,"regulation of multicellular organismal process"),
c("GO:0065007","biological regulation",68.28146902158677,2.0814015707304767,1,-0,"biological regulation"),
c("GO:0065009","regulation of molecular function",9.408466498458088,4.7594507517174005,0.9483762052322795,0.04401932,"regulation of molecular function"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
treemap(
  stuff,
  index = c("representative","description"),
  vSize = "value",
  type = "categorical",
  vColor = "representative",
  title = "Revigo TreeMap",
  inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
  lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
  bg.labels = "#CCCCCCAA",   # define background color of group labels
								 # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
  position.legend = "none"
)

dev.off()

