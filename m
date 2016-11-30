From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH V3] leds: pca955x: Add ACPI support for pca955x
Date: Wed, 30 Nov 2016 09:17:45 +0100
Message-ID: <c1d0e813-9e1e-b387-735a-2c8f39c5308e@samsung.com>
References: <CGME20161130030845epcas5p2369d1c7cabb765ef0039b8e8d5aaa965@epcas5p2.samsung.com>
 <1480475311-14385-1-git-send-email-tnhuynh@apm.com>
 <302ebc57-6f52-b0ff-e354-0c67556a88ed@samsung.com>
 <7efcf021-72c9-328a-ad88-4c226e8b5d6d@samsung.com>
 <CANQ9TuAc8S-Q2Wx_qkJLLMd8dH7XDiGchB7EesPW1is9oFqWhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-reply-to: <CANQ9TuAc8S-Q2Wx_qkJLLMd8dH7XDiGchB7EesPW1is9oFqWhA@mail.gmail.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Tin Huynh <tnhuynh@apm.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Loc Ho <lho@apm.com>, Thang Nguyen <tqnguyen@apm.com>, Phong Vo <pvo@apm.com>, patches <patches@apm.com>
List-Id: linux-leds@vger.kernel.org

On 11/30/2016 09:06 AM, Tin Huynh wrote:
> On Wed, Nov 30, 2016 at 3:01 PM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>>
>> On 11/30/2016 08:51 AM, Jacek Anaszewski wrote:
>>>
>>> Hi Tin,
>>>
>>> How this patch is different from the one already merged?
>>>
>>> Best regards,
>>> Jacek Anaszewski
>>>
>>> On 11/30/2016 04:08 AM, Tin Huynh wrote:
>>>>
>>>> This patch enables ACPI support for leds-pca955x driver.
>>>>
>>>> Signed-off-by: Tin Huynh <tnhuynh@apm.com>
>>>> ---
>>>>  drivers/leds/leds-pca955x.c |   22 +++++++++++++++++++++-
>>>>  1 files changed, 21 insertions(+), 1 deletions(-)
>>>>
>>>> Change from V2:
>>>>  -Correct coding conventions.
>>>>
>>>> Change from V1:
>>>>  -Remove CONFIG_ACPI.
>>>>
>>>> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
>>>> index 840401a..b168ebe 100644
>>>> --- a/drivers/leds/leds-pca955x.c
>>>> +++ b/drivers/leds/leds-pca955x.c
>>>> @@ -40,6 +40,7 @@
>>>>   *  bits the chip supports.
>>>>   */
>>>>
>>>> +#include <linux/acpi.h>
>>>>  #include <linux/module.h>
>>>>  #include <linux/delay.h>
>>>>  #include <linux/string.h>
>>>> @@ -100,6 +101,15 @@ struct pca955x_chipdef {
>>>>  };
>>>>  MODULE_DEVICE_TABLE(i2c, pca955x_id);
>>>>
>>>> +static const struct acpi_device_id pca955x_acpi_ids[] = {
>>>> +    { .id = "PCA9550", .driver_data = pca9550 },
>>>> +    { .id = "PCA9551", .driver_data = pca9551 },
>>>> +    { .id = "PCA9552", .driver_data = pca9552 },
>>>> +    { .id = "PCA9553", .driver_data = pca9553 },
>>>> +    { }
>>
>>
>> OK, I see that you brought back explicit properties in the
>> structure initializer. Is there some vital reason for that?
>> You're mentioning "correcting coding conventions" in the
>> patch changelog. checkpatch.pl --strict doesn't complain about
>> that, so what coding conventions you have on mind?
>
>
>>
>>
>>>> +MODULE_DEVICE_TABLE(acpi, pca955x_acpi_ids);
>>>> +
>>>>  struct pca955x {
>>>>      struct mutex lock;
>>>>      struct pca955x_led *leds;
>>>> @@ -250,7 +260,16 @@ static int pca955x_probe(struct i2c_client *client,
>>>>      struct led_platform_data *pdata;
>>>>      int i, err;
>>>>
>>>> -    chip = &pca955x_chipdefs[id->driver_data];
>>>> +    if (id) {
>>>> +        chip = &pca955x_chipdefs[id->driver_data];
>>>> +    } else {
>>>> +        const struct acpi_device_id *acpi_id;
>
> I added '{}' follow if

You had it already in V1. Please verify if the patch applied
to the for-next branch of linux-leds.git has the shape you intended:

https://git.kernel.org/cgit/linux/kernel/git/j.anaszewski/linux-leds.git/commit/?h=for-next&id=e46895b71a26da404c4d95cb2bab1a67cf8b20bc

-- 
Best regards,
Jacek Anaszewski
