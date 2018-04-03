From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [GIT PULL] LED updates for 4.17-rc1
Date: Tue, 3 Apr 2018 21:14:43 +0200
Message-ID: <6f46bc83-dc2a-722b-5a3a-cd62a9dcfde8@gmail.com>
References: <1522782593-3782-1-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522782593-3782-1-git-send-email-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linus.walleij@linaro.org, pavel@ucw.cz, tredaelli@redhat.com, ulli.kroll@googlemail.com, vadimp@mellanox.com
List-Id: linux-leds@vger.kernel.org

On 04/03/2018 09:09 PM, Jacek Anaszewski wrote:
> Hi Linus,
> 
> Please pull LED updates for 4.17-rc1:
> 
> New LED class driver:
>   - add driver for Mellanox regmap LEDs
> 
> Improvement to ledtrig-activity:

It should be of course: "Improvement to ledtrig-disk".

>   - extend disk trigger for reads and writes
> 
> Improvements and fixes to existing LED class drivers:
>   - add more product/board names for PC Engines APU2
>   - fix wrong dmi_match on PC Engines APU LEDs
>   - clarify chips supported by LM355x driver
>   - fix Kconfig text for MLXCPLD, SYSCON, MC13783, NETXBIG
>   - allow leds-mlxcpld compilation for 32 bit arch
> 
> The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:
> 
>   Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds_for_4.17-rc1
> 
> for you to fetch changes up to 92d7ec1d71e351f11ba503369eb78225510cfcc7:
> 
>   leds: Fix wrong dmi_match on PC Engines APU LEDs (2018-03-20 20:28:00 +0100)
> 
> Thanks,
> Jacek Anaszewski
> 
> ----------------------------------------------------------------
> LED updates for 4.17-rc1
> ----------------------------------------------------------------
> Hans Ulli Kroll (1):
>       leds: Fix wrong dmi_match on PC Engines APU LEDs
> 
> Linus Walleij (1):
>       leds: Extends disk trigger for reads and writes
> 
> Pavel Machek (1):
>       leds: Clarify supported chips by LM355x driver
> 
> Timothy Redaelli (1):
>       leds: Add more product/board names for PC Engines APU2
> 
> Vadim Pasternak (3):
>       leds: leds-mlxcpld: Allow compilation for 32 bit arch
>       leds: fix Kconfig text for MLXCPLD, SYSCON, MC13783, NETXBIG
>       leds: add driver for support Mellanox regmap LEDs for BMC and x86 platform
> 
>  MAINTAINERS                         |   1 +
>  drivers/ata/libata-core.c           |   2 +-
>  drivers/ide/ide-disk.c              |   2 +-
>  drivers/leds/Kconfig                |  29 ++--
>  drivers/leds/Makefile               |   1 +
>  drivers/leds/leds-apu.c             |  28 +++-
>  drivers/leds/leds-mlxreg.c          | 281 ++++++++++++++++++++++++++++++++++++
>  drivers/leds/trigger/ledtrig-disk.c |  12 +-
>  include/linux/leds.h                |   4 +-
>  9 files changed, 342 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/leds/leds-mlxreg.c
> 

-- 
Best regards,
Jacek Anaszewski
