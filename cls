[33mcommit 524ced5899263ca6ca77bc634af7eef2d858d7c9[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m, [m[1;31morigin/master[m[33m, [m[1;31morigin/HEAD[m[33m)[m
Merge: e81d36b 050f16b
Author: Michael Pound <michael.pound@nottingham.ac.uk>
Date:   Thu May 21 23:14:12 2020 +0100

    Merge pull request #22 from H4CKY54CK/master
    
    Suppressing Decompression Bomb warning.

[33mcommit 050f16b9c6603f5c4769f1434e25da885e17ba57[m
Author: H4CKY54CK <tk13xr37@gmail.com>
Date:   Sun May 17 22:50:18 2020 -0400

    Update solve.py

[33mcommit e81d36ba767e2bcbe85e1e916c7154ac453466d5[m
Author: mikepound <mppound@gmail.com>
Date:   Tue Feb 28 14:04:06 2017 +0000

    Fixed issue with missing width/height in PIL

[33mcommit 6cba31af221ab18154fda9ff1dd99c7f02c2208a[m
Author: mikepound <mppound@gmail.com>
Date:   Tue Feb 28 08:49:23 2017 +0000

    Update README.md
    
    Altered the readme to refer to the wiki.

[33mcommit 57b37de50674b3238c0a821765d40eabc0a98f74[m
Author: Michael Pound <mppound@gmail.com>
Date:   Sun Feb 26 17:00:45 2017 +0000

    Updated readme files.

[33mcommit c30deebd66076607d44ebfc5a92df31296a9c483[m
Author: Michael Pound <mppound@gmail.com>
Date:   Sun Feb 26 16:52:01 2017 +0000

    Improved image output to avoid Numpy. Now works with larger 15k images. Removed/replaced vertical15k.png.

[33mcommit 4ad672cfec4288d1fd139a5074387053c9136538[m
Merge: 0e88d6d b5ae1ae
Author: mikepound <mppound@gmail.com>
Date:   Sun Feb 26 12:04:48 2017 +0000

    Merge pull request #7 from PhyNerd/patch-1
    
    Break in entrance/exit loops

[33mcommit b5ae1ae045819cb21de18ec2d39ca46b7db48e10[m
Merge: fc2a587 0e88d6d
Author: PhyNerd <jan.wrk.fb@gmail.com>
Date:   Sun Feb 26 12:59:22 2017 +0100

    Merge branch 'master' into patch-1

[33mcommit 0e88d6dd74b361b78f9b736d243bc66c4b387376[m
Merge: 148349c 2de85e0
Author: mikepound <mppound@gmail.com>
Date:   Sun Feb 26 10:22:45 2017 +0000

    Merge pull request #8 from jmitchell/optimize-priority-queue
    
    Use a faster priority queue implementation

[33mcommit 2de85e03b9659c9d41e46bfdcc27584134228920[m
Author: Jacob Mitchell <jmitchell@member.fsf.org>
Date:   Sun Feb 26 01:42:07 2017 -0800

    Remove redundant priority queue calls
    
    Rather than getting the minimum element and then calling
    removeminimum, just have removeminimum return the removed
    element. This gives a significant speed improvement to all priority
    queue implementations. HeapPQ's relative gain in performance exceeds
    FibPQ's, so it's now the default.
    
        FibPQ:
        profile.py  203.06s user 3.63s system 100% cpu 3:26.50 total
    
        HeapPQ:
        profile.py  130.79s user 2.84s system 100% cpu 2:13.50 total

[33mcommit d605da6b55f2d5dfea3b9444ec98e3f121279edb[m
Author: Jacob Mitchell <jmitchell@member.fsf.org>
Date:   Sat Feb 25 16:03:24 2017 -0800

    Fix priority queue bugs and add another priority queue
    
    Mazes with multiple solutions were failing when A-Star and Dijkstra
    used the new HeapPQ implementation. Those issues are now
    resolved.
    
    Based on the current profile.py FibPQ and HeapPQ now neck and
    neck.
    
        FibPQ:
        profile.py  228.22s user 2.53s system 100% cpu 3:50.53 total
    
        HeapPQ:
        profile.py  228.36s user 3.66s system 100% cpu 3:51.86 total
    
    There's still room for other optimization opportunities, like
    refactoring so client code doesn't call `unvisited.minimium` to get a
    copy of the minimum entry and then immediately call
    `unvisited.removeminimum`. If the `removeminimum` were changed to
    return the removed entry, redundant `minimum`, `remove`, and `insert`
    calls could be eliminated. Based on the profiler output images,
    HeapPQ's bottleneck by and large is `heappop` and `heappush`, so this
    change could be a major speed improvement.
    
    The new priority queue, QueuePQ, is based on Python's
    Queue.PriorityQueue. Underneath it's also implemented using heapq, but
    adds synchronization primitives. This makes it slower than HeapPQ;
    however, the synchronization features may be desirable in some
    contexts.

[33mcommit 148349cbd8d4d0e8846d9f3704d3d8650a18666c[m
Merge: d7fd5b5 a2fa1a0
Author: mikepound <mppound@gmail.com>
Date:   Sat Feb 25 22:58:19 2017 +0000

    Merge pull request #6 from jmitchell/profiling
    
    Instrument with profiling to facilitate optimizations

[33mcommit d7fd5b5f20b21804e1dd692e37f93913c6fdbd21[m
Merge: 8d6ab59 c0ed4a2
Author: mikepound <mppound@gmail.com>
Date:   Sat Feb 25 22:57:42 2017 +0000

    Merge pull request #5 from jmitchell/cleanup
    
    Standardize formatting

[33mcommit 93608238c314a868faa0be1f2b1a272adb0fcd6c[m
Author: Jacob Mitchell <jmitchell@member.fsf.org>
Date:   Sat Feb 25 13:36:01 2017 -0800

    Use heapq priority queue implementation instead of FibHeap
    
    Based on runs of profile.py, the heapq implementation is significantly
    faster.

[33mcommit fc2a587dde128595793ea794fd8e0bc7377ba014[m
Author: PhyNerd <jan.wrk.fb@gmail.com>
Date:   Sat Feb 25 22:33:30 2017 +0100

    entrance/exit
    
    Since there can only be one entrance/exit to the maze there is no need to continue searching after finding one.

[33mcommit 0cdc72fafafab4a15cf7e9babf40d7e8dd7f38d3[m
Author: Jacob Mitchell <jmitchell@member.fsf.org>
Date:   Sat Feb 25 13:01:38 2017 -0800

    Add PriorityQueue abstract class and FibHeap shim
    
    This will make it easier to test different priority queue
    implementations.

[33mcommit a2fa1a0dee97a9e48281bc179bf8f01d7c72859c[m
Author: Jacob Mitchell <jmitchell@member.fsf.org>
Date:   Sat Feb 25 11:55:48 2017 -0800

    Generate call graph of expensive functions
    
    Depends on Graphviz (http://www.graphviz.org/) and the BProfile
    package (pip install bprofile).

[33mcommit 6534e4e78306e3b1c5d4303ea4a9d109b6073c27[m
Author: Jacob Mitchell <jmitchell@member.fsf.org>
Date:   Sat Feb 25 11:55:25 2017 -0800

    Make entrypoint ammenable to profiling

[33mcommit c0ed4a25c746c03db378b7a06977093251340f26[m
Author: Jacob Mitchell <jmitchell@member.fsf.org>
Date:   Sat Feb 25 11:16:22 2017 -0800

    Add gitignore

[33mcommit b357dfe9665b944f451c3aa803da2abaf29ab6ce[m
Author: Jacob Mitchell <jmitchell@member.fsf.org>
Date:   Sat Feb 25 11:12:14 2017 -0800

    Run reindent.py on all files

[33mcommit 8d6ab599240015a16c2db38b0ff65c8ef0d43844[m
Merge: a5f3be3 86474e5
Author: mikepound <mppound@gmail.com>
Date:   Sat Feb 25 08:57:12 2017 +0000

    Merge pull request #2 from JosephBywater/master
    
    Removed semicolons from line endings.

[33mcommit 86474e5558bd0e9a7841c50d74c61a050bef1a9d[m
Author: TheJJ100100 <jabjab.co.uk@gmail.com>
Date:   Fri Feb 24 23:43:48 2017 +0000

    Removed semicolons from line endings. Closes #1

[33mcommit a5f3be30cd325f43b9487c681c3c25377f314988[m
Author: Michael Pound <mppound@gmail.com>
Date:   Wed Feb 22 11:35:47 2017 +0000

    Readme updates.

[33mcommit 7fda80f7d01102b17b37ef9daa0c240277b280ae[m
Author: Michael Pound <mppound@gmail.com>
Date:   Wed Feb 22 11:28:23 2017 +0000

    Added a logo maze

[33mcommit 2e503e42a0d7707aad403a1b7dc68fdad9f84df2[m
Author: Michael Pound <mppound@gmail.com>
Date:   Sun Feb 12 19:30:39 2017 +0000

    Minor changes and a bug fix.

[33mcommit 40826e863135b46fdd679b5dd2e9dab47446e1e4[m
Author: Michael Pound <mppound@gmail.com>
Date:   Sun Feb 12 17:42:54 2017 +0000

    Uploaded files.

[33mcommit 1b381a6db307dae83a9bc3cf5c470897b2d516b0[m
Author: mikepound <mppound@gmail.com>
Date:   Sun Feb 12 12:13:17 2017 +0000

    Initial commit
