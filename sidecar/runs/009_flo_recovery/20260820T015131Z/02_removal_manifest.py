# Removal manifest for Architecture Canvas recovery (course 75249)
# Every entry proven: legacy/wrong-course, zero submission content (with_content=0
# on every one of the 27 live assignments; 0 discussion entries on 533438),
# not referenced by desired state (desired builder produces no object with these
# ids/titles), and (for files) unreferenced after the paired object is removed.

REMOVE_DISCUSSION_TOPICS = [
    {"id": 533438, "title": "Introduction Video", "module": 212431,
     "reason": "legacy Kim-Zachary-era intro discussion; 0 entries; no desired mapping"},
]

REMOVE_ASSIGNMENTS = [
    {"id": 893529, "title": "Students Academic and Integrity Drop Box ", "module": 212431,
     "reason": "legacy academic-integrity boilerplate; with_content=0; no desired mapping"},
    {"id": 893522, "title": "Chapter 1: Computer Abstract/Tech", "module": 212432,
     "reason": "legacy zyBooks chapter placeholder ('Please read and complete activities in Zybook'); with_content=0"},
    {"id": 893523, "title": "Chapter 2: Instructions", "module": 212433, "reason": "legacy zyBooks chapter placeholder; with_content=0"},
    {"id": 893524, "title": "Chapter 3: Arithmetic for Computers", "module": 212434, "reason": "legacy zyBooks chapter placeholder; with_content=0"},
    {"id": 893525, "title": "Chapter 4: The Processor", "module": 212435, "reason": "legacy zyBooks chapter placeholder; with_content=0"},
    {"id": 893526, "title": "Chapter 5: Memory Hierarchy", "module": 212436, "reason": "legacy zyBooks chapter placeholder; with_content=0"},
    {"id": 893527, "title": "Chapter 6: Parallel Processors", "module": 212437, "reason": "legacy zyBooks chapter placeholder; with_content=0"},
    {"id": 893518, "title": "Appendix B", "module": 212438, "reason": "legacy zyBooks appendix placeholder, empty body; with_content=0"},
    # orphans: course-wide assignments not linked into any live module
    {"id": 893517, "title": "Appendix A", "module": None, "reason": "orphaned legacy zyBooks appendix placeholder, empty body; with_content=0"},
    {"id": 893519, "title": "Appendix C", "module": None, "reason": "orphaned legacy zyBooks appendix placeholder, empty body; with_content=0"},
    {"id": 893520, "title": "Appendix D", "module": None, "reason": "orphaned legacy zyBooks appendix placeholder, empty body; with_content=0"},
    {"id": 893521, "title": "Appendix E", "module": None, "reason": "orphaned legacy zyBooks appendix placeholder, empty body; with_content=0"},
    {"id": 893528, "title": "MIPS Labs", "module": None, "reason": "orphaned legacy zyBooks lab placeholder, empty body; with_content=0"},
]

REMOVE_MODULES = [
    {"id": 212431, "title": "Week 1", "reason": "legacy old-numbering module; superseded by kickoff modules 218090-218094"},
    {"id": 212432, "title": "Week 2 and 3", "reason": "legacy zyBooks-chapter module"},
    {"id": 212433, "title": "Week 4 and 5", "reason": "legacy zyBooks-chapter module"},
    {"id": 212434, "title": "Week 6 and 7", "reason": "legacy zyBooks-chapter module"},
    {"id": 212435, "title": "Week 8 and 9", "reason": "legacy zyBooks-chapter module"},
    {"id": 212436, "title": "Week 10 and 11", "reason": "legacy zyBooks-chapter module"},
    {"id": 212437, "title": "Week 12 and 13", "reason": "legacy zyBooks-chapter module"},
    {"id": 212438, "title": "Week 14 and 15", "reason": "legacy zyBooks-chapter module"},
    {"id": 212439, "title": "Week 16", "reason": "legacy empty/unpublished placeholder module; title-collision risk with desired Week 16"},
]

REMOVE_ASSIGNMENT_GROUPS = [
    {"id": 152780, "title": "Assignments", "reason": "Canvas-default 0%-weight legacy group holding only removed zyBooks assignments; not one of the 11 desired weighted groups; removed only after it is empty"},
]

# Files removed only after the object/page that references them is handled.
REMOVE_FILES = [
    {"id": 6493330, "name": "Student Academic Integrity Policies and Agreement  (5).docx",
     "reason": "already unreferenced by any live object"},
    {"id": 6493331, "name": "Student Academic Integrity Policies and Agreement (As Amended) (7.23).docx",
     "reason": "referenced only by removed assignment 893529; unreferenced after its removal"},
    {"id": 6493329, "name": "kim.jpg",
     "reason": "referenced only by the legacy 'home' page body; unreferenced after that page is replaced"},
]

# Course-settings/identity replacement (not delete): the wrong-course
# front-page/home identity and syllabus_body, neither of which is modeled
# by imprint.schema.DesiredCourse or touched by push_course/reconcile.
REPLACE_COURSE_SETTINGS = {
    "default_view": {"from": "wiki", "to": "modules",
                      "reason": "front page currently renders Kim Zachary identity; Modules is the actual student navigation surface (matches the already-live, correctly-ordered kickoff modules at position 1-5)"},
    "syllabus_body": {"reason": "contains Kim Zachary name/email/phone and zyBooks purchase instructions; replaced with accurate Jeremy Evert / Computer Architecture orientation text"},
}
REPLACE_PAGE_HOME = {
    "url": "home", "reason": "front page body contains Kim Zachary identity and zyBooks setup instructions; replaced with neutral Computer Architecture orientation pointing students to Modules",
}
