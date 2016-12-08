From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 0/7] Move dell-led to drivers/platform/x86
Date: Thu, 08 Dec 2016 15:26:37 +0100
Message-ID: <327c8edc-5a1e-8a94-85b2-4a2febc03352@samsung.com>
References: <CGME20161208123909epcas3p23229f5e0d337e19a27b272211798d364@epcas3p2.samsung.com>
 <20161208123618.28603-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51500 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932090AbcLHO0n (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Dec 2016 09:26:43 -0500
In-reply-to: <20161208123618.28603-1-kernel@kempniu.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Richard Purdie <rpurdie@rpsys.net>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Bob Rodgers <Robert_Rodgers@dell.com>, Louis Davis <Louis_Davis@dell.com>, Jim Dailey <Jim_Dailey@dell.com>, Alex Hung <alex.hung@canonical.com>, Hui Wang <hui.wang@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

Hi Michał,

Thanks for the patch set.

On 12/08/2016 01:36 PM, Michał Kępień wrote:
> This patch series moves the dell-led driver from the LED subsystem to
> the x86 platform driver subsystem.  I decided to also CC the sound
> subsystem contacts for the whole series as
> sound/pci/hda/dell_wmi_helper.c is also affected.
>
> The original motivation behind this effort was to move all code using
> the dell-smbios module to the x86 platform driver subsystem.  While I
> was investigating the possibilites to do that, it quickly emerged that
> dell-led can and in fact should be moved to the x86 platform driver
> subsystem in its entirety.
>
> dell-led consists of two major parts:
>
>   - the part exposing a microphone mute LED interface, introduced in
>     db6d8cc ("dell-led: add mic mute led interface"); this interface is
>     used by sound/pci/hda/dell_wmi_helper.c; while the original
>     implementation used a WMI interface, it was changed to use
>     dell-smbios in cf0d7ea ("dell-led: use dell_smbios_find_token() for
>     finding mic DMI tokens") and 0c41a08 ("dell-led: use
>     dell_smbios_send_request() for performing SMBIOS calls"),
>
>   - the part handling an activity LED present in Dell Latitude 2100
>     netbooks, introduced in 72dcd8d ("leds: Add Dell Business Class
>     Netbook LED driver"); it binds to a specific WMI GUID and then
>     registers a LED device which is controlled using WMI (i.e. it is
>     basically a WMI driver).
>
> Patches 1-4 clean up the microphone mute LED interface to minimize the
> amount of code moved around.
>
> Patch 5 moves the microphone mute LED interface to
> drivers/platform/x86/dell-laptop.c, effectively causing
> sound/pci/hda/dell_wmi_helper.c to depend on CONFIG_DELL_LAPTOP instead
> of CONFIG_LEDS_DELL_NETBOOKS.
>
> Patch 6 reverts dell-led to the state it was in after its initial commit
> 72dcd8d ("leds: Add Dell Business Class Netbook LED driver") by removing
> all remnants of the microphone mute LED handling code.
>
> Patch 7 moves all that is left of dell-led (i.e. the activity LED part,
> as originally implemented), to a new module which is placed in
> drivers/platform/x86/dell-wmi-led.c.
>
> This patch series is based on linux-leds/for-4.11 as the LED subsystem
> is affected by all patches except patch 3.
>
> If anyone reading this has access to a Dell device which has an activity
> LED and/or a microphone mute LED currently supported by dell-led, I
> would love to hear from you as I do not have the hardware needed to
> practically test this patch series.

I think that it is necessary to find someone who will give their
Tested-by.

What I can accept immediately is moving the driver in the current
shape to x86 platform drivers. I could expose a stable branch with
that patch for the x86 platform maintainers then.

>  drivers/leds/Kconfig                               |  9 ---
>  drivers/leds/Makefile                              |  1 -
>  drivers/platform/x86/Kconfig                       |  8 +++
>  drivers/platform/x86/Makefile                      |  1 +
>  drivers/platform/x86/dell-laptop.c                 | 28 ++++++++
>  .../dell-led.c => platform/x86/dell-wmi-led.c}     | 75 +++-------------------
>  include/linux/dell-led.h                           |  6 +-
>  sound/pci/hda/dell_wmi_helper.c                    | 18 +++---
>  8 files changed, 55 insertions(+), 91 deletions(-)
>  rename drivers/{leds/dell-led.c => platform/x86/dell-wmi-led.c} (73%)
>


-- 
Best regards,
Jacek Anaszewski
