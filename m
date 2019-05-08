From: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: WARNING in untrack_pfn
Date: Wed, 8 May 2019 14:37:44 +0200
Message-ID: <CACT4Y+bcdEg_M5RNVKQvYPVLs1skvatGW-yTht7yDexR=Hjnyw@mail.gmail.com>
References: <000000000000f70a0e0571ad8ffb@google.com> <0000000000007b03eb058653caea@google.com>
 <20190412130112.GA8384@amd> <alpine.DEB.2.20.1904121520350.22857@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1904121520350.22857@hadrien>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Pavel Machek <pavel@ucw.cz>, syzbot <syzbot+e1a4f80c370d2381e49f@syzkaller.appspotmail.com>, Borislav Petkov <bp@alien8.de>, Dan Williams <dan.j.williams@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Dave Jiang <dave.jiang@intel.com>, Haozhong Zhang <haozhong.zhang@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, jacek.anaszewski@gmail.com, LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, rpurdie@rpsys.net, syzkaller-bugs <syzkaller-bugs@googlegroups.com>, Thomas Gleixner <tglx@linutronix.de>, the arch/x86 maintainers <x86@kernel.or>
List-Id: linux-leds@vger.kernel.org

From: Julia Lawall
Date: Fri, Apr 12, 2019 at 3:21 PM

> On Fri, 12 Apr 2019, Pavel Machek wrote:
>
> > On Fri 2019-04-12 04:42:01, syzbot wrote:
> > > syzbot has bisected this bug to:
> > >
> > > commit c68729119f4d2993bec3c9cb999ad76de5aeddba
> > > Author: Julia Lawall <Julia.Lawall@lip6.fr>
> > > Date:   Sat Jul 15 09:58:19 2017 +0000
> > >
> > >     leds: tlc591xx: add missing of_node_put
> > >
> > > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12cda0f3200000
> > > start commit:   23203e3f Merge branch 'akpm' (patches from Andrew)
> > > git tree:       upstream
> > > final crash:    https://syzkaller.appspot.com/x/report.txt?x=11cda0f3200000
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=16cda0f3200000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=861a3573f4e78ba1
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=e1a4f80c370d2381e49f
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17836d15400000
> > >
> > > Reported-by: syzbot+e1a4f80c370d2381e49f@syzkaller.appspotmail.com
> > > Fixes: c68729119f4d ("leds: tlc591xx: add missing of_node_put")
> > >
> > > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> >
> > Can you revert c68729119f4d2993bec3c9cb999ad76de5aeddba on master and
> > see  if it fixes the problem? Because this is hard to believe...
>
> Likewise, it seems hard to believe that the change is a problem.  But
> could the problem be elsewhere and triggered by this code?

Looking at the bisection log, this looks like a hard to reproduce,
flaky crash. Most likely the crash did not fire on one of the commits
and that diverted bisection in the wrong direction.
