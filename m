From: Phong Vo <pvo@apm.com>
Subject: RE: [PATCH V3] leds: pca955x: Add ACPI support for pca955x
Date: Wed, 30 Nov 2016 16:10:59 +0700
Message-ID: <328afec669295cbc3a4338a4347e7067@mail.gmail.com>
References: <CGME20161130030845epcas5p2369d1c7cabb765ef0039b8e8d5aaa965@epcas5p2.samsung.com>
 <1480475311-14385-1-git-send-email-tnhuynh@apm.com> <302ebc57-6f52-b0ff-e354-0c67556a88ed@samsung.com>
 <7efcf021-72c9-328a-ad88-4c226e8b5d6d@samsung.com> <CANQ9TuAc8S-Q2Wx_qkJLLMd8dH7XDiGchB7EesPW1is9oFqWhA@mail.gmail.com>
 <c1d0e813-9e1e-b387-735a-2c8f39c5308e@samsung.com> <dc989a8b92342d2ceb63381ae9dc019d@mail.gmail.com>
 <10443ff4-67ff-d474-401f-21fa7f33a9a5@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <10443ff4-67ff-d474-401f-21fa7f33a9a5@samsung.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Loc Ho <lho@apm.com>, Thang Nguyen <tqnguyen@apm.com>, patches <patches@apm.com>, Tin Huynh <tnhuynh@apm.com>, peda@axentia.se
List-Id: linux-leds@vger.kernel.org

+-----Original Message-----
+From: Jacek Anaszewski [mailto:j.anaszewski@samsung.com]
+Sent: Wednesday, November 30, 2016 4:00 PM
+To: Phong Vo
+Cc: Mika Westerberg; Rafael J. Wysocki; Richard Purdie; linux-
+leds@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
+acpi@vger.kernel.org; Loc Ho; Thang Nguyen; patches; Tin Huynh
+Subject: Re: [PATCH V3] leds: pca955x: Add ACPI support for pca955x
+
+Hi Phong,
+
+On 11/30/2016 09:23 AM, Phong Vo wrote:
+> +-----Original Message-----
+> +From: Jacek Anaszewski [mailto:j.anaszewski@samsung.com]
+> +Sent: Wednesday, November 30, 2016 3:18 PM
+> +To: Tin Huynh
+> +Cc: Mika Westerberg; Rafael J. Wysocki; Richard Purdie; linux-
+> +leds@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
+> +acpi@vger.kernel.org; Loc Ho; Thang Nguyen; Phong Vo; patches
+> +Subject: Re: [PATCH V3] leds: pca955x: Add ACPI support for pca955x
+> +
+> +On 11/30/2016 09:06 AM, Tin Huynh wrote:
+> +> On Wed, Nov 30, 2016 at 3:01 PM, Jacek Anaszewski
+> +> <j.anaszewski@samsung.com> wrote:
+> +>>
+> +>> On 11/30/2016 08:51 AM, Jacek Anaszewski wrote:
+> +>>>
+> +>>> Hi Tin,
+> +>>>
+> +>>> How this patch is different from the one already merged?
+> +>>>
+> +>>> Best regards,
+> +>>> Jacek Anaszewski
+> +>>>
+>
+> Hi Jacek, I am answering on behalf of Tin.
+> This patch is for the leds:pca955x driver while the previous one was
+> for leds:pca963x driver!
+> They are almost the same in the coding construct, but different
+drivers.
+
+Ah, indeed, that's why I got lost with patch version numbering :-)
+
+> +>>> On 11/30/2016 04:08 AM, Tin Huynh wrote:
+> +>>>>
+> +>>>> This patch enables ACPI support for leds-pca955x driver.
+> +>>>>
+> +>>>> Signed-off-by: Tin Huynh <tnhuynh@apm.com>
+> +>>>> ---
+> +>>>>  drivers/leds/leds-pca955x.c |   22 +++++++++++++++++++++-
+> +>>>>  1 files changed, 21 insertions(+), 1 deletions(-)
+> +>>>>
+> +>>>> Change from V2:
+> +>>>>  -Correct coding conventions.
+> +>>>>
+> +>>>> Change from V1:
+> +>>>>  -Remove CONFIG_ACPI.
+> +>>>>
+> +>>>> diff --git a/drivers/leds/leds-pca955x.c
+> +>>>> b/drivers/leds/leds-pca955x.c index 840401a..b168ebe 100644
+> +>>>> --- a/drivers/leds/leds-pca955x.c
+> +>>>> +++ b/drivers/leds/leds-pca955x.c
+> +>>>> @@ -40,6 +40,7 @@
+> +>>>>   *  bits the chip supports.
+> +>>>>   */
+> +>>>>
+> +>>>> +#include <linux/acpi.h>
+> +>>>>  #include <linux/module.h>
+> +>>>>  #include <linux/delay.h>
+> +>>>>  #include <linux/string.h>
+> +>>>> @@ -100,6 +101,15 @@ struct pca955x_chipdef {  };
+> +>>>> MODULE_DEVICE_TABLE(i2c, pca955x_id);
+> +>>>>
+> +>>>> +static const struct acpi_device_id pca955x_acpi_ids[] = {
+> +>>>> +    { .id = "PCA9550", .driver_data = pca9550 },
+> +>>>> +    { .id = "PCA9551", .driver_data = pca9551 },
+> +>>>> +    { .id = "PCA9552", .driver_data = pca9552 },
+> +>>>> +    { .id = "PCA9553", .driver_data = pca9553 },
+> +>>>> +    { }
+> +>>
+> +>>
+> +>> OK, I see that you brought back explicit properties in the
+> +>> structure initializer. Is there some vital reason for that?
+>
+> It's not vital, but to make it consistent with what was done for
+> pca963x,
+
+For pca963x I applied the version without explicit properties.
+Note that this is consistent with pca963x_id array above the added
+pca963x_acpi_ids. For pca955x the situation is the same.
+
+> and also per suggestion by Mika on reviewing  a different driver
+> mux:954x in another thread.
+
+Could you give a reference to that thread? In the review of V1 of this
+patch Mika mentioned "{ "PCA9553", pca9553 }" scheme.
+

Actually it was Peter Rosin (not Mika) on linux-i2c and the reference to
that is follows

https://lkml.org/lkml/2016/11/18/732

I am including Robin here.

Thanks.

+> I would think this would make the definition clearer.
+>
+> +>> You're mentioning "correcting coding conventions" in the patch
+> +>> changelog. checkpatch.pl --strict doesn't complain about that, so
+> +>> what coding conventions you have on mind?
+> +>
+> +>
+> +>>
+> +>>
+> +>>>> +MODULE_DEVICE_TABLE(acpi, pca955x_acpi_ids);
+> +>>>> +
+> +>>>>  struct pca955x {
+> +>>>>      struct mutex lock;
+> +>>>>      struct pca955x_led *leds;
+> +>>>> @@ -250,7 +260,16 @@ static int pca955x_probe(struct i2c_client
+> +*client,
+> +>>>>      struct led_platform_data *pdata;
+> +>>>>      int i, err;
+> +>>>>
+> +>>>> -    chip = &pca955x_chipdefs[id->driver_data];
+> +>>>> +    if (id) {
+> +>>>> +        chip = &pca955x_chipdefs[id->driver_data];
+> +>>>> +    } else {
+> +>>>> +        const struct acpi_device_id *acpi_id;
+> +>
+> +> I added '{}' follow if
+> +
+> +You had it already in V1. Please verify if the patch applied to the
+> +for- next branch of linux-leds.git has the shape you intended:
+> +
+> +https://git.kernel.org/cgit/linux/kernel/git/j.anaszewski/linux-
+> +leds.git/commit/?h=for-next&id=e46895b71a26da404c4d95cb2bab1a67cf8b20
+> +bc
+> +
+> +--
+> +Best regards,
+> +Jacek Anaszewski
+> --
+> To unsubscribe from this list: send the line "unsubscribe linux-leds"
+> in the body of a message to majordomo@vger.kernel.org More majordomo
+> info at  http://vger.kernel.org/majordomo-info.html
+>
+>
+>
+
+
+--
+Best regards,
+Jacek Anaszewski
