From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: [PATCH v3] led/led-class: Handle LEDs with the same name
Date: Sat, 28 Mar 2015 09:07:05 +0800
Message-ID: <20150328010705.GB3891@wfg-t540p.sh.intel.com>
References: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com>
 <20150326233025.GR18321@valkosipuli.retiisi.org.uk>
 <CAPybu_1thjCfz3Xomzpvc3Hpw2j_z8rXpmp28WnuRBDE0DYAtA@mail.gmail.com>
 <CAK5ve-KLmETc1Ym1xvwTuvG7f5O1w6s=u3fgdGcYT8GHCWT+VA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK5ve-KLmETc1Ym1xvwTuvG7f5O1w6s=u3fgdGcYT8GHCWT+VA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Sakari Ailus <sakari.ailus@iki.fi>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christopher Li <sparse@chrisli.org>, Kees Cook <keescook@chromium.org>
List-Id: linux-leds@vger.kernel.org

+ Kees Cook

On Fri, Mar 27, 2015 at 10:24:53AM -0700, Bryan Wu wrote:
> On Fri, Mar 27, 2015 at 1:09 AM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
> > Hi Sakari
> >
> > cc: adding Greg (core and FormatGuard) and Chistopher (sparse)
> >>
> >> I just realised there was another issue --- the name is now interpreted as
> >> format string. Bad things will happen if there's e.g. %s in the name itself
> >> --- perhaps unlikely, but possible.
> >
> > Good catch!
> >
> > Would it be possible to add a sparse check to avoid this in all the kernel?
> >
> > And what about a macro protection like FormatGuard?
> >
> > https://www.usenix.org/legacy/events/sec01/full_papers/cowanbarringer/cowanbarringer.pdf
> >
> >
> 
> I think Fengguang's 0-DAY kernel test infrastructure can help this.

Kees' format-security branch has a check on dynamic printf format
string, which has been effective in finding errors like:

   drivers/tty/serial/sb1250-duart.c: In function 'sbd_map_port':
>> drivers/tty/serial/sb1250-duart.c:680:3: error: format not a string literal and no format arguments [-Werror=format-security]
      printk(err);                                                                                                              
      ^           

I wonder if Kees has the plan to include the patch into upstream and
make it a kconfig option. For your convenience, the patch is pasted
below. 

Thanks,
Fengguang
---

commit 95420c349194d1b570270ba1b1567d85461761c3
Author:     Kees Cook <keescook@chromium.org>
AuthorDate: Mon Sep 16 11:15:54 2013 -0700
Commit:     Kees Cook <keescook@chromium.org>
CommitDate: Wed Mar 4 14:07:18 2015 -0800

    Make all format string problems fail the build
    
    In an effort to stop format strings from leaking into various callers,
    have gcc stop the build when this gets detected.
    
    Signed-off-by: Kees Cook <keescook@chromium.org>

diff --git a/Makefile b/Makefile
index e6a9b1b..b7684d2 100644
--- a/Makefile
+++ b/Makefile
@@ -402,7 +402,6 @@ KBUILD_CPPFLAGS := -D__KERNEL__
 KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
                   -fno-strict-aliasing -fno-common \
                   -Werror-implicit-function-declaration \
-                  -Wno-format-security \
                   -std=gnu89
 
 KBUILD_AFLAGS_KERNEL :=
@@ -752,6 +751,11 @@ endif
 NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 CHECKFLAGS     += $(NOSTDINC_FLAGS)
 
+# Enable format-security when it can stop the build, otherwise disable.
+KBUILD_CFLAGS  += $(call cc-option,\
+                       -Wformat -Wformat-security -Werror=format-security,\
+                       -Wno-format-security)
+
 # warn about C99 declaration after statement
 KBUILD_CFLAGS += $(call cc-option,-Wdeclaration-after-statement,)
