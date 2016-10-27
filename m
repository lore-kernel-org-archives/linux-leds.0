From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 5/5] platform: x86: dell-*: Simplify dell-rbtn
 integration with dell-laptop [untested]
Date: Thu, 27 Oct 2016 13:59:49 +0200
Message-ID: <20161027115949.GU12154@pali>
References: <20161026174118.3431-1-hdegoede@redhat.com>
 <20161026174118.3431-5-hdegoede@redhat.com>
 <20161027103845.GT12154@pali>
 <3b38c193-7b19-3170-b14e-3627844cbec0@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3b38c193-7b19-3170-b14e-3627844cbec0@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thursday 27 October 2016 13:46:33 Hans de Goede wrote:
> Hi,
> 
> On 27-10-16 12:38, Pali Rohár wrote:
> >On Wednesday 26 October 2016 19:41:18 Hans de Goede wrote:
> >>Use dell_smbios*notifier for dell-laptop to listen to dell-rbtn slider
> >>events, replace dell_rbtn_notifier_register() /
> >>dell_rbtn_notifier_unregister() with a single dell_rbtn_has_rfkill() used
> >>by dell-laptop to decide whether or not to use the i8042 filter and used
> >>by dell-rbtn to auto-remove its rfkill interface when called.
> >>
> >>This results in a nice cleanup, downside is that the rfkill interface
> >>of dell-rbtn is not automatically re-enabled on rmmod dell-laptop, this
> >>now requires rmmod + insmod of dell-rbtn. But people who do not want
> >>dell-laptop for some reason will have it blacklisted anyways, so this
> >>is not an issue and there is a work-around.
> >>
> >>Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>---
> >>Changes in v2:
> >>-This is a new patch in v2 of my platform/x86/dell-* notifier set intended
> >> to show how dell_smbios*notifier can be used to improve the dell-rbtn
> >> integration too
> >>Changes in v3:
> >>-Call dell_rbtn_has_rfkill_func instead of dell_rbtn_has_rfkill, so that the
> >> dynamic symbol dance we do to allow loading without dell-rbtn actually works.
> >>---
> >> drivers/platform/x86/Kconfig       |  1 +
> >> drivers/platform/x86/dell-laptop.c | 53 +++++++-------------------------
> >> drivers/platform/x86/dell-rbtn.c   | 63 +++++++++-----------------------------
> >> drivers/platform/x86/dell-rbtn.h   |  5 +--
> >> drivers/platform/x86/dell-smbios.h |  1 +
> >> 5 files changed, 29 insertions(+), 94 deletions(-)
> >
> >Looks like that for preventing sending event that rfkill switch was
> >changed by hardware slider we must always drop atk i8042 keycode...
> >
> >Needs to check if key is really send by both dell-rbtn and also by atk
> >i8042 keyboard driver and if yes then i8042_install_filter() is always
> >needed (if rbtn is there or not)...
> 
> But this is not related to this patch, right? This patch does not change
> any behavior. Other then your concerns about where to put the notifier,
> do you like the approach of this patch?

It is not related, but if above is truth, then another rewrite (also of
those your changes!) is needed. So maybe it would be better to postpone
(or drop this patch from your patch series) so we do not invest time for
something which will be again rewritten...

-- 
Pali Rohár
pali.rohar@gmail.com
