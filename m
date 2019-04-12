From: syzbot <syzbot+e1a4f80c370d2381e49f@syzkaller.appspotmail.com>
Subject: Re: WARNING in untrack_pfn
Date: Fri, 12 Apr 2019 04:42:01 -0700
Message-ID: <0000000000007b03eb058653caea@google.com>
References: <000000000000f70a0e0571ad8ffb@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <000000000000f70a0e0571ad8ffb@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia.Lawall@lip6.fr, bp@alien8.de, dan.j.williams@intel.com, dave.hansen@linux.intel.com, dave.jiang@intel.com, haozhong.zhang@intel.com, hpa@zytor.com, jacek.anaszewski@gmail.com, julia.lawall@lip6.fr, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, luto@kernel.org, mingo@redhat.com, pavel@ucw.cz, pbonzini@redhat.com, peterz@infradead.org, rkrcmar@redhat.com, rpurdie@rpsys.net, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org
List-Id: linux-leds@vger.kernel.org

syzbot has bisected this bug to:

commit c68729119f4d2993bec3c9cb999ad76de5aeddba
Author: Julia Lawall <Julia.Lawall@lip6.fr>
Date:   Sat Jul 15 09:58:19 2017 +0000

     leds: tlc591xx: add missing of_node_put

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12cda0f3200000
start commit:   23203e3f Merge branch 'akpm' (patches from Andrew)
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=11cda0f3200000
console output: https://syzkaller.appspot.com/x/log.txt?x=16cda0f3200000
kernel config:  https://syzkaller.appspot.com/x/.config?x=861a3573f4e78ba1
dashboard link: https://syzkaller.appspot.com/bug?extid=e1a4f80c370d2381e49f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17836d15400000

Reported-by: syzbot+e1a4f80c370d2381e49f@syzkaller.appspotmail.com
Fixes: c68729119f4d ("leds: tlc591xx: add missing of_node_put")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
