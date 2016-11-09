From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH] firmware: fix async/manual firmware loading
Date: Wed, 9 Nov 2016 23:02:11 +0100
Message-ID: <20161109220210.GJ13978@wotan.suse.de>
References: <20161030145048.6291-1-corsac@corsac.net>
 <20161030145048.6291-2-corsac@corsac.net>
 <1477848538.3456.1.camel@corsac.net>
 <20161109203656.GG13978@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161109203656.GG13978@wotan.suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: "Luis R. Rodriguez" <mcgrof@kernel.org>, Matt Domsch <Matt_Domsch@dell.com>, Fengguang Wu <fengguang.wu@intel.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, Abhay Salunke <Abhay_Salunke@dell.com>, David Woodhouse <dwmw2@infradead.org>
Cc: Yves-Alexis Perez <corsac@corsac.net>, linux-kernel@vger.kernel.org, Ming Lei <ming.lei@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, Jouni Malinen <j@w1.fi>, Kees Cook <keescook@chromium.org>, Jiri Kosina <jkosina@suse.cz>, Jiri Slaby <jslaby@suse.com>, Tom Gundersen <teg@jklm.no>, Kay Sievers <kay@vrfy.org>, Josh Boyer <jwboyer@fedoraproject.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andy Lutomirski <luto@amacapital.net>, Harald Hoyer <harald@redhat.com>, Seth Forshee <seth.forshee@canonical.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Torvalds <torvalds@linux-foundation.org>, Daniel Wagner <wagi@monom.org>, stable@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wed, Nov 09, 2016 at 09:36:56PM +0100, Luis R. Rodriguez wrote:
> On Sun, Oct 30, 2016 at 06:28:58PM +0100, Yves-Alexis Perez wrote:
> > On Sun, 2016-10-30 at 15:50 +0100, Yves-Alexis Perez wrote:
> > > wait_for_completion_interruptible_timeout() return value is either
> > > -ERESTARTSYS (in case it was interrupted), 0 (in case the timeout expired)
> > > or the number of jiffies left until timeout. The return value is stored in
> > > a long, but in _request_firmware_load() it's silently casted to an int,
> > > which can overflow and give a negative value, indicating an error.
> > > 
> > > Fix this by re-using the timeout variable and only set retval when it's
> > > safe.
> > 
> > I completely messed-up my git send-email (sorry), so the cover letter only
> > went to LKML and I assume nobody read it. So just in case, I'm pasting it
> > below because it gives some more explanation about how I tested this:
> 
> Please include the information below in the commit log.
> 
> > when trying to (ab)use the firmware loading interface in a local kernel module
> > (in order to load the EEPROM content into a PCIE card), I noticed that the
> > manual firmware loading interface (the one from
> > /sys/class/firmware/<foo>/{loading,data}) was broken.
> > 
> > After instrumenting the kernel I noticed an issue with the way
> > wait_for_completion_interruptible_timeout() is called in _request_firmware()
> > and especially how the return value is handled: it's supposed to be a long, but
> > here it's silently casted to an int and tested if positive.
> 
> This is certainly an issue and thanks for addressing this. Please Cc:
> Daniel Wagner <wagi@monom.org> (and others I've added to this thread)
> on a follow up patch with the commit log fixed up a bit more given Daniel
> is working on replacing the call:
> 
> wait_for_completion_interruptible_timeout() with
> swait_event_interruptible_timeout()
> 
> I checked and swait_event_interruptible_timeout() uses schedule_timeout(),
> and this does not return a negative value, so this issue would not be
> present there *but* -- Daniel  you do cast the value, please revise
> your code with this consideration as well in your next patch set follow up.
> 
> > The initial timeout seems to be LONG_MAX 
> 
> No, the default timeout is 60, so 60 * HZ, unless you provided an override,
> but the override is only possible via the syfs UMH interface and set via
> timeout_store(), if you provide a value then its set on an int loading_timeout
> variable and its supposed to represent seconds. simple_strtol() is used to parse the
> value set, and note this is returns long, so a cast is done here as well,
> the max value which will return a positive cast int you can set is 2147483647
> (INT_MAX):
> 
> echo 2147483647 > /sys/class/firmware/timeout
> 
> Finally if the value provided in sysfs is negative or if the cast yields
> a negative (anything greater than 2147483647) value then loading_timeout is
> set to 0:
> 
> echo 2147483648 > /sys/class/firmware/timeout
> cat /sys/class/firmware/timeout
> 0
> 
> In practice firmware_loading_timeout() is what we use to get the timeout
> used for the UMH interface. This call will always check if the int value
> loading_timeout is negative or 0 and if it is it sets loading_timeout to
> MAX_JIFFY_OFFSET. Since timeout_store() forces the value to be 0 or positive
> the negative check is never effective, so the only way to get MAX_JIFFY_OFFSET
> is to either force a negative value parsed by simple_strtol() (when values
> greater than INT_MAX are passed) or just setting the timeout to 0. When this
> is done MAX_JIFFY_OFFSET is used and note this is:
> 
> #define MAX_JIFFY_OFFSET ((LONG_MAX >> 1)-1)
> 
> When we cast MAX_JIFFY_OFFSET to int we get -2, if we just used LONG_MAX
> this would be cast to -1, so both are negative. In our current worst case we
> end up with -2 set when the UMH timeout is overridden to force a timeout of
> 0 to be set when either a sysfs timeout value is set to value of 0 or
> greater than INT_MAX.

Actually... we also set the timeout to MAX_JIFFY_OFFSET when FW_OPT_UEVENT is
not set. This happens *only* when the UMH was explicitly requested on the
async call, when the second argument to request_firmware_nowait() is false.
There are *only* two callers that do this in the kernel. If this is correct *and*
the assessment of the cast from long to int here is correct that should mean
these two callers in the kernel that have always requested the UMH firmware
*fallback* have *always* had a faulty UMH fallback return value...

The two drivers would be:

drivers/firmware/dell_rbu.c
drivers/leds/leds-lp55xx-common.c

Can the maintainers of these two drivers comment on the below..

If this really has been broken for ages and since we are trying to minimize
more use of the UMH I wonder if fixing it would set us back in compartamentalizing
the UMH further. This bug discover and the current situation with the UMH udev
helper (no longer in systemd) makes me inclined to just recommend for us seriously
to rip this out completely. Note that there are two uses for the explicit firmware
UMH fallback -- one where the uevent is set (Johannes presumably this is your use
case that you are interested in) and one where it is not set. You *can* request
firmware with the uevent set (second argument to request_firmware_nowait() is true,
but run in a kernel with CONFIG_FW_LOADER_USER_HELPER_FALLBACK set (not all distros).

Does Android enable CONFIG_FW_LOADER_USER_HELPER_FALLBACK ? Johannes were you relying
on CONFIG_FW_LOADER_USER_HELPER_FALLBACK and the uevent set for your use case you
had in mind ?

Has this really been broken for ages???! Note that the current test driver
never tested it...

  Luis

> Please amend your commit log with the above.
> 
> >(since it's a manual firmware loading you're supposed to
> > have all the time you want to do it),
> 
> We have learned that this is stupid for a few reasons, some of this is
> some drivers are not written properly and can stall certain processes in
> the kernel when the firmware is not found. In the worst case kernels
> with CONFIG_FW_LOADER_USER_HELPER_FALLBACK enabled will *always* use
> the UMH fallback even if on synchronous calls, these days most distributions
> fortunately disable CONFIG_FW_LOADER_USER_HELPER_FALLBACK as such only
> explicit callers are using the UMH. We are currently working on
> compartamentalizing the UMH [0] as it has proven to cause many headaches,
> some other issues are still being discussed [1].
> 
> [0] https://lkml.kernel.org/r/1476957132-27818-1-git-send-email-wagi@monom.org
> [1] https://lkml.kernel.org/r/20161108224726.GD13978@wotan.suse.de
> 
> > so the return value overflows the int.
> 
> The above explain how and when this can happen.
> 
> > Attached patch fixes the problem here, although there might be a better way. I
> > tested it using lib/test_firmware.c kernel module, with the following patch to
> > enable manual loading:
> > 
> > diff --git a/lib/test_firmware.c b/lib/test_firmware.c
> > index a3e8ec3..01d333c 100644
> > --- a/lib/test_firmware.c
> > +++ b/lib/test_firmware.c
> > @@ -105,7 +105,7 @@ static ssize_t trigger_async_request_store(struct device *dev,
> >         mutex_lock(&test_fw_mutex);
> >         release_firmware(test_firmware);
> >         test_firmware = NULL;
> > -       rc = request_firmware_nowait(THIS_MODULE, 1, name, dev, GFP_KERNEL,
> > +       rc = request_firmware_nowait(THIS_MODULE, 0, name, dev, GFP_KERNEL,
> >                                      NULL, trigger_async_request_cb);
> >         if (rc) {
> >                 pr_info("async load of '%s' failed: %d\n", name, rc);
> > 
> > Then load test_firmware and:
> > 
> > # echo -n test > /sys/devices/virtual/misc/test_firmware/trigger_async_request
> > 
> > In another terminal, do:
> > 
> > # echo -n 1 > /sys/class/firmware/test/loading
> > # echo -n data > /sys/class/firmware/test/data
> > # echo -n 0 > /sys/class/firmware/test/loading
> > 
> > Without the patch, the loading fails right after the "echo -n 0", with it the loading succeeds with:
> > 
> > [   96.405171] test_firmware: loaded: 4
> 
> Thanks for the fix, please start the commit log explaining what can cause the
> issue and immediately the effect, leave the verbose explanation for later,
> a kernel maintainer wants to easily get the impact / cases of the issue and
> the severity of the issue. In this case the issue can only be caused by
> a manual override as root to the timeout for the UMH to force it to 0, and
> the only issue is a failed firmware request. Since not many are using the
> UMH these days (only explicit callers on drivers that require it on most
> distros at least), and since most distributions are not overriding the
> timeout I don't think this is necessarily a critical issue for stable, I'll
> let Greg decide. I know there was some recent talks over what goes into stable
> and I think this is a good example case to consider where the line is grey.
> 
> As a maintainer I personally would avoid recommending this for stable, but
> others may disagree. Cc'd enough folks so they can cherry pick on their own
> kernel if this does not go to stable but they do want it in their kernel.
> 
>   Luis
> 

-- 
Luis Rodriguez, SUSE LINUX GmbH
Maxfeldstrasse 5; D-90409 Nuernberg
