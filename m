From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 0/6] Move dell-led to drivers/platform/x86
Date: Tue, 17 Jan 2017 22:20:29 +0100
Message-ID: <0989ec2f-c776-13f5-3933-0cb60b36f8ed@gmail.com>
References: <20170116132204.6421-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170116132204.6421-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Takashi Iwai <tiwai@suse.com>
Cc: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Andy Shevchenko <andy.shevchenko@gmail.com>, Anthony Wong <anthony.wong@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Darren,

Are you OK with the patches 4/6 and 6/6? If so, could you give
your ack so that I could apply the whole patch set to the LED tree?

Best regards,
Jacek Anaszewski

On 01/16/2017 02:21 PM, Michał Kępień wrote:
> This patch series moves the dell-led driver from the LED subsystem to
> the x86 platform driver subsystem.
> 
> The original motivation behind this effort was to move all code using
> the dell-smbios module to the x86 platform driver subsystem.  While I
> was investigating the possibilities to do that, it quickly emerged that
> dell-led can and in fact should be moved to the x86 platform driver
> subsystem in its entirety.
> 
> dell-led consists of two major parts:
> 
>   - the part exposing a microphone mute LED interface, introduced in
>     db6d8cc00773 ("dell-led: add mic mute led interface"); this
>     interface is used by sound/pci/hda/dell_wmi_helper.c; while the
>     original implementation used a WMI interface, it was changed to use
>     dell-smbios in cf0d7ea33596 ("dell-led: use dell_smbios_find_token()
>     for finding mic DMI tokens") and 0c41a08e131d ("dell-led: use
>     dell_smbios_send_request() for performing SMBIOS calls"),
> 
>   - the part handling an activity LED present in Dell Latitude 2100
>     netbooks, introduced in 72dcd8d08aca ("leds: Add Dell Business Class
>     Netbook LED driver"); it binds to a specific WMI GUID and then
>     registers a LED device which is controlled using WMI (i.e. it is
>     essentially a WMI driver).
> 
> Patches 1 and 2 clean up the microphone mute LED interface to minimize
> the amount of code moved around.
> 
> Patch 3 updates a variable name in sound/pci/hda/dell_wmi_helper.c so
> that it better matches that variable's role.
> 
> Patch 4 moves the microphone mute LED interface to
> drivers/platform/x86/dell-laptop.c, effectively causing
> sound/pci/hda/dell_wmi_helper.c to depend on CONFIG_DELL_LAPTOP instead
> of CONFIG_LEDS_DELL_NETBOOKS.
> 
> Patch 5 reverts dell-led to the state it was in after its initial commit
> 72dcd8d08aca ("leds: Add Dell Business Class Netbook LED driver") by
> removing all remnants of the microphone mute LED handling code.
> 
> Patch 6 moves all that is left of dell-led (i.e. the activity LED part,
> as originally implemented), to a new module which is placed in
> drivers/platform/x86/dell-wmi-led.c.
> 
> As all patches except patch 3 in this series affect the LED subsystem,
> the series is based on linux-leds/for-4.11.
> 
> Anthony, I would be grateful if you could test this patch series on the
> Dell machines you have access to that were previously supported by
> dell-led as Jacek needs a Tested-by from someone to sign off on these
> changes.  Please note the Kconfig option rename done by the last patch.
> Thanks!
> 
> Changes from v1:
> 
>   - Squash patches 2-4 from v1 into a single patch (#2 in v2).
> 
>   - Add patch 3.
> 
>   - Fix subject pattern in patch 4.
> 
>   - Slight commit message adjustments, including fixing a typo
>     ("COFIG_LEDS_DELL_NETBOOKS") in patch 6.
> 
>   - Remove the name of the module's source file from the header comment
>     in drivers/platform/x86/dell-wmi-led.c to avoid the need to update
>     it in the future.
> 
>  drivers/leds/Kconfig                               |  9 ---
>  drivers/leds/Makefile                              |  1 -
>  drivers/platform/x86/Kconfig                       |  8 +++
>  drivers/platform/x86/Makefile                      |  1 +
>  drivers/platform/x86/dell-laptop.c                 | 28 ++++++++
>  .../dell-led.c => platform/x86/dell-wmi-led.c}     | 75 ++--------------------
>  include/linux/dell-led.h                           |  6 +-
>  sound/pci/hda/dell_wmi_helper.c                    | 30 ++++-----
>  8 files changed, 60 insertions(+), 98 deletions(-)
>  rename drivers/{leds/dell-led.c => platform/x86/dell-wmi-led.c} (73%)
> 
