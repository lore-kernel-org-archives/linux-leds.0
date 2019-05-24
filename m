From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: linux-next: Tree for May 24 (leds-lm3697)
Date: Fri, 24 May 2019 22:27:16 +0200
Message-ID: <06097597-2d41-64a0-f4bc-d14ce2c832b5@gmail.com>
References: <20190524140727.19d1e349@canb.auug.org.au>
 <f8300d14-972d-1c03-3266-836b94c1ec9a@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f8300d14-972d-1c03-3266-836b94c1ec9a@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Randy,

Thank you for the report.

On 5/24/19 5:42 PM, Randy Dunlap wrote:
> On 5/23/19 9:07 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> News: there will be no linux-next release on Monday.
>>
>> Changes since 20190523:
>>
>> The input-current tree gained a build failure so I reverted a commit.
>>
>> The drm-fixes tree gained a build failure so I reverted a commit.
>>
>> The v4l-dvb tree gained a conflict against Linus' tree.
>>
>> Non-merge commits (relative to Linus' tree): 1814
>>   1870 files changed, 61172 insertions(+), 32723 deletions(-)
>>
>> ----------------------------------------------------------------------------
>>
>> I have created today's linux-next tree at
>> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
>> are tracking the linux-next tree using git, you should not use "git pull"
>> to do so as that will try to merge the new linux-next release with the
>> old one.  You should use "git fetch" and checkout or reset to the new
>> master.
>>
>> You can see which trees have been included by looking in the Next/Trees
>> file in the source.  There are also quilt-import.log and merge.log
>> files in the Next directory.  Between each merge, the tree was built
>> with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
>> multi_v7_defconfig for arm and a native build of tools/perf. After
>> the final fixups (if any), I do an x86_64 modules_install followed by
>> builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
>> ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
>> and sparc64 defconfig. And finally, a simple boot test of the powerpc
>> pseries_le_defconfig kernel in qemu (with and without kvm enabled).
>>
>> Below is a summary of the state of the merge.
>>
>> I am currently merging 290 trees (counting Linus' and 70 trees of bug
>> fix patches pending for the current merge release).
>>
>> Stats about the size of the tree over time can be seen at
>> http://neuling.org/linux-next-size.html .
>>
>> Status of my local build tests will be at
>> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
>> advice about cross compilers/configs that work, we are always open to add
>> more builds.
>>
>> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
>> Gortmaker for triage and bug fixes.
>>
> 
> seen on i386:
> 
> ld: drivers/leds/leds-lm3697.o: in function `lm3697_probe':
> leds-lm3697.c:(.text+0x451): undefined reference to `devm_of_led_classdev_register'
> 
> CONFIG_LEDS_CLASS=m
> CONFIG_LEDS_TI_LMU_COMMON=y
> CONFIG_LEDS_LM3697=y
> 
> 
> It looks to me like this is needed:
> 
> 	depends on LEDS_CLASS && I2C && OF
> ?
> 

Thanks for the hint.

I believe the following amendment would fit best:

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index e2f19f3cc6ca..ab0ac84e4c62 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -785,6 +785,7 @@ config LEDS_NIC78BX

  config LEDS_TI_LMU_COMMON
         tristate "LED driver for TI LMU"
+       depends on LEDS_CLASS
         depends on REGMAP
         help
           Say Y to enable the LED driver for TI LMU devices.
@@ -794,6 +795,7 @@ config LEDS_TI_LMU_COMMON
  config LEDS_LM3697
         tristate "LED driver for LM3697"
         depends on LEDS_TI_LMU_COMMON
+       depends on I2C && OF
         help
           Say Y to enable the LM3697 LED driver for TI LMU devices.
           This supports the LED device LM3697.

But for now I'm dropping the patch set anyway until we agree on how
it should be merged across subsystems.

-- 
Best regards,
Jacek Anaszewski
