Object subclass: #StudentRole

Instance Variables
	phase	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of phase
	researchRelatorsCol	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of researchRelatorsCol

Constraints:

The phase attribute is lazy-initialized to SuspendedStudentPhase in order to ensure XOR constraint and the multiplicity of 1.
ResearchRelatorsCol must be checked softly for multiplicity 1..* using the checkResearchRelatorsColMult method.
!

	
	^phase ifNil: [phase := SuspendedStudentPhase new]! !
	
	phase := anObject! !
	"Checking of researchRelatorsCol multiplicity constraint 1..*"
	
	^self researchRelatorsCol size >= 1! !
	"Adds this student in aResearchGroup: aResearchGroup adds to the researchRelatorsCol and self to aResearchGroup membership.  Returns the new relator."
	
	| relator |
	relator := StudentsResearchMembershipRelator researchGroup: aResearchGroup.
	self researchRelatorsCol add: relator.
	aResearchGroup membershipsSet add: self.
	^relator! !
	"returns set of research groups, where the student participates"
	
	^(self researchRelatorsCol collect: [:each | each researchGroup]) asSet! !
	"Removes this student from a research group. Returns the old relator."
	
	| relator |
	relator := self researchRelatorsCol detect: [:each | each researchGroup == aResearchGroup].
	self researchRelatorsCol remove: relator.
	aResearchGroup membershipsSet remove: self.
	^relator! !
	"This is accessor with lazy initialization of the collection.
	ATTENTION: This method is intended to be used for accessing the collection members only. The researchRelatorsCol collection is a contradirectional replica of membershipsSet. Do neither add nor remove entries in this collection without proper replication!!"
	
	^researchRelatorsCol ifNil: [researchRelatorsCol := OrderedCollection new]! !
	"Answer a newly created and initialized instance."
	
	^self shouldNotImplement! !

Constraints: None
!
	"Answer a newly created and initialized instance."
	
	^super new initialize! !

Instance Variables
	teachingRelatorsCol	<(Collection of: (AD2ClassModel | AD2DiagramSpec | AD2GeneralPreferencesDialog | AD2Images | AD2PainterPreferencesDialog | AD2PrinterPreferencesDialog | AragonTreeNode | BufferedValueHolder | DaskalosAbstractSymbol | DaskalosBrowser | DragHandle | PluggableAdaptor | ProtocolAdaptor | RangeAdaptor | RFC822Message | RuntimeBuilderEditor | StorePublishAnnouncement | StoreWorkActivity | SubjectRegistration | TeachingRelator))>	description of teachingRelatorsCol

Constraints:

Multiplicity of the teachingRelators association must be checked -- it is required to be at least 1.
!
	
	^self teachingRelatorsCol size >= 1! !
	
	^(self teachingRelatorsCol collect: [:each | each subject]) asSet! !
	
	^teachingRelatorsCol ifNil: [teachingRelatorsCol := OrderedCollection new]! !
	"Answer a newly created and initialized instance."

	^super new initialize! !

Instance Variables
	registered	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of registered
	subject	<GbxAbstractProxy | LensAbsentee | Object | ProtoObject | RemoteObject>	description of subject

Constraints:

	subject multiplicity is ensured by the class instance creation method subject: while disabling new at the same time.
!
	"Initialize a newly created instance. This method must answer the receiver."
	
	super initialize.
	registered := TimeStamp now.
	^self! !
	
	^registered! !
	
	registered := anObject! !
	
	^subject! !
	
	subject := anObject! !
	
	^self shouldNotImplement! !
	
	^(super new)
		subject: aSubject;
		initialize;
		yourself	"sets timestamp to the current date-time"! !

Instance Variables
	code	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of code
	name	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of name
	staffCol	<Set>	description of staffCol

Constraints:

Multiplicity of the staff association must be checked -- it is required to be at least 1.
!
	"Checking of staff multiplicity constraint 1..*"
	
	^self staffSet size >= 1! !

	^code! !

	code := anObject! !
	"collect all the subjects that the members of this department guarantee"
	
	| roles |
	roles := self staffSet flatCollect: [:professor | professor subjectGuarantorRolesCol].
	^(allSubjectsSet select: [:each | roles includes: each guarantor]) asSet! !

	^name! !

	name := anObject! !
	
	^staffSet ifNil: [staffSet := Set new]! !
	"collect all the subjects that the teachers of this department teach"
	
	^(self staffSet flatCollect: [:professor | professor teacherRolesCol flatCollect: [:teacherRole | teacherRole teachesSet]]) asSet! !
	"Answer a newly created and initialized instance."

	^super new initialize! !

Instance Variables
	researchGroup	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of researchGroup
	startDate	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of startDate

Constraints:

		researchGroup multiplicity is ensured by the class instance creation method researchGroup: while disabling new at the same time.
!
	"Initialize a newly created instance. This method must answer the receiver."
	
	super initialize.
	startDate := Date today.
	^self! !
	
	^researchGroup! !
	
	researchGroup := anObject! !
	
	^startDate! !
	
	startDate := anObject! !
	
	^self shouldNotImplement! !
	
	^(super new)
		researchGroup: aResearchGroup;
		initialize;
		yourself! !

Constraints: None
!

Instance Variables
	guarantor multiplicity is ensured by the class instance creation method guarantor: while disabling new at the same time.

!

	^code! !

	code := anObject! !

	^credits! !

	credits := anObject! !
	
	^guarantor! !
	
	guarantor := anObject! !

	^name! !

	name := anObject! !
	"String representation in the Inspector and Debugger"
	
	^self code isNil
		ifTrue: ['']
		ifFalse: [self code]! !
	
	^(super new)
		guarantor: aSubjectGuarantorRole;
		initialize;
		yourself! !
	
	^self shouldNotImplement! !

Instance Variables
	room	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of room
	subject	<GbxAbstractProxy | LensAbsentee | Object | ProtoObject | RemoteObject>	description of subject
	time	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of time

Constraints:

	subject multiplicity is ensured by the class instance creation method subject: while disabling new at the same time.
!

	^room! !

	room := anObject! !

	^subject! !

	subject := anObject! !

	^time! !

	time := anObject! !
	"Answer a newly created and initialized instance."
	
	^self shouldNotImplement! !
	
	^(super new)
		initialize;
		subject: aSubject;
		yourself! !

Instance Variables
	registeredSubjectsCol	<(Collection of: (AD2ClassModel | AD2DiagramSpec | AD2GeneralPreferencesDialog | AD2Images | AD2PainterPreferencesDialog | AD2PrinterPreferencesDialog | AragonTreeNode | BufferedValueHolder | DaskalosAbstractSymbol | DaskalosBrowser | DragHandle | PluggableAdaptor | ProtocolAdaptor | RangeAdaptor | RFC822Message | RuntimeBuilderEditor | StorePublishAnnouncement | StoreWorkActivity | SubjectRegistration | TeachingRelator))>	description of registeredSubjectsCol

*Constraints:*

Multiplicity of /registeredSubjects/ is ensured by implementation. No special check is needed.
!
	"collects all subjects that are bound to the active student by the registeredSubjects association"
	
	^(self registeredSubjectsCol collect: [:each | each subject]) asSet! !
	
	^registeredSubjectsCol ifNil: [registeredSubjectsCol := OrderedCollection new]! !
	"Answer a newly created and initialized instance."
	
	^super new initialize! !

Instance Variables
	researchRelatorsCol	<(Collection of: ResearchMembershipRelator)>	description of researchRelatorsCol

Constraints:

ResearchRelatorsCol must be checked softly for multiplicity 1..* using the checkResearchRelatorsColMult method.
!
	"This is accessor with lazy initialization of the collection.
	ATTENTION: This method is intended to be used for accessing the collection members only. The researchRelatorsCol collection is a contradirectional replica of membershipsSet. Do neither add nor remove entries in this collection without proper replication!!"
	
	^researchRelatorsCol ifNil: [researchRelatorsCol := OrderedCollection new]! !
	
	^researchPoints ifNil: [researchPoints := 0]! !
	
	researchPoints := anObject! !
	
	^roleName! !
	
	roleName := anObject! !
	
	^self researchPoints * self class moneyPerResearchPoint! !
	"Checking of researchRelatorsCol multiplicity constraint 1..*"
	
	^self researchRelatorsCol size >= 1! !
	"Adds a professor to a research group. Returns the new relator."
	
	| relator |
	relator := ProfessorsResearchMembershipRelator researchGroup: aResearchGroup.
	self researchRelatorsCol add: relator.
	aResearchGroup membershipsSet add: aProfessor.
	^relator! !
	"returns set of research groups, where the professor participates"
	
	^(self researchRelatorsCol collect: [:each | each researchGroup]) asSet! !
	"Removes a professor from a research group. Returns the old relator."
	
	| relator |
	relator := self researchRelatorsCol detect: [:each | each researchGroup == aResearchGroup].
	self researchRelatorsCol remove: relator.
	aResearchGroup membershipsSet remove: aProfessor.
	^relator! !
	
	^self researchPoints > aResearcherRole researchPoints! !
	
	^300! !
	"Answer a newly created and initialized instance."
	
	^super new initialize! !

Instance Variables
	headOfDepartment	<Boolean>	description of headOfDepartment
	startDate	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of dateOfBirth

Constraints:

None.
!
	^person! !

	^headOfDepartment ifNil: [headOfDepartment := false]! !

	headOfDepartment := anObject! !

	^self person name! !

	self person name: anObject! !
	
	^self person nameWithTitles! !
	
	^self subrolesCol select: [:r | r isKindOf: ResearcherRole]! !
	
	| years |
	years := Date today year - self startDate year.
	^self class fixRate + (years * self class bonusPerYear)! !
	
	^startDate! !
	
	startDate := anObject! !
	
	^self subrolesCol select: [:r | r isKindOf: SubjectGuarantorRole]! !
	
	^subrolesCol ifNil: [subrolesCol := OrderedCollection new]! !
	
	^self subrolesCol select: [:r | r isKindOf: TeacherRole]! !

	^self person titlesAfter! !

	self person titlesAfter: anObject! !

	^self person titlesBefore! !

	self person titlesBefore: anObject! !
	
	^self teacherRolesCol size >= 1! !
	
	super initialize.
	startDate := Date today.
	^self! !
	
	^2000! !
	
	^14000! !
	"Answer a newly created and initialized instance."

	^self shouldNotImplement! !

ATTENTION: Do neither add nor remove entries in the membershipsSet collection without proper replication!! The membershipsSet collection is just a contradirectional replica of researchRelators and is kept consistent with them by the respective add and remove methods of ResearchRole and StudentRole objects."

Note: the membershipsSet instance variable keeps references to members of the research group. The collection must be updated every time when one of the researchRelators gets changed. That data replication is an alternative solution to a method, which would have to query the system with a complicated and difficult navigation, like e.g. Department>>taughtSubjects (there the difficult navigation has been chosen). Here the navigation would be much more difficult, since it requires:
- selecting the research group of our interest
- construction of a temporary collection containing all students with their research groups
- construction of a temporary collection containing all researchers with their research groups
- selecting the students and researchers, who belong to the selected research group, from the union of both temporary collections"

Constraints: None
!
	"This collection is just a contradirectional replica of researchRelators."
	
	^self membershipsSet asSortedCollection: [:a :b | a name <= b name]	"

Note: the membershipsSet instance variable keeps references to members of the research group. The collection must be updated every time when one of the researchRelators gets changed. That data replication is an alternative solution to a method, which would have to query the system with a complicated and difficult navigation, like e.g. Department>>taughtSubjects (there the difficult navigation has been chosen). Here the navigation would be much more difficult, since it requires:
- selecting the research group of our interest
- construction of a temporary collection containing all students with their research groups
- construction of a temporary collection containing all researchers with their research groups
- selecting the students and researchers, who belong to the selected research group, from the union of both temporary collections"! !
	"This is accessor with lazy initialization of the collection.
	ATTENTION: Consider using membershipsCol instead of this method!! This method is intended to be used only privately in ResearchGroup objects and by ResearcherRole and StudentRole objects. The membershipsSet collection is just a contradirectional replica of researchRelators. Do neither add nor remove entries in this collection without proper replication!!"
	
	^membershipsSet ifNil: [membershipsSet := Set new]	"

Note: the membershipsSet instance variable keeps references to members of the research group. The collection must be updated every time when one of the researchRelators gets changed. That data replication is an alternative solution to a method, which would have to query the system with a complicated and difficult navigation, like e.g. Department>>taughtSubjects (there the difficult navigation has been chosen). Here the navigation would be much more difficult, since it requires:
- selecting the research group of our interest
- construction of a temporary collection containing all students with their research groups
- construction of a temporary collection containing all researchers with their research groups
- selecting the students and researchers, who belong to the selected research group, from the union of both temporary collections"! !
	
	^name! !
	
	name := anObject! !
	"Answer a newly created and initialized instance."
	
	^super new initialize! !

Constraints: None
!

Instance Variables
	startDate	<Date>	description of startDate

Constraints: None
!
	
	^startDate ifNil: [startDate := Date today]! !
	
	startDate := anObject! !
	"Answer a newly created and initialized instance."
	
	^super new initialize! !

Instance Variables
	rolesCol	<OrderedCollection>	description of rolesCol
	name   	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of surname
	titlesAfter	<Future | GbxAbstractProxy | LensAbsentee | MessageForwarder | Object | ProtoObject | ProtoObject | Proxy | WeakProxy>	description of titlesAfter
	titlesBefore	<Announcement | AnnouncementSet | ExceptionSet | GenericException | GlorpExpression | GRPrinter | Join | LensContainer | LensExpressionSurrogate | SequenceableCollection | Signal | SortFunction | URLwithPath | WAExceptionHandler | WAExceptionHandler>	description of titlesBefore

Constraints:

None.
!

	^name! !

	name := anObject! !
	
	^self titlesBefore , ' ' , self name, ' ' , self titlesAfter! !

	^titlesAfter! !

	titlesAfter := anObject! !

	^titlesBefore! !

	titlesBefore := anObject! !
	"Answer a newly created and initialized instance."

	^super new initialize! !