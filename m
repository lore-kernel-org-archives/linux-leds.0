From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Fix platform data in leds-pca955x.c
Date: Wed, 4 Jul 2018 23:15:24 +0300
Message-ID: <CAHp75VcbwPJGdMxXutxHDrdstcfAa7H0Sc5ntWdOUVvvSHkQ8w@mail.gmail.com>
References: <62fb47ea-9296-139b-1eeb-28ddc5826091@landley.net>
 <CAHp75Vc+2rjFcLfuV5ao0eGmz2aF4jRS_YTZQTaRx=45sOSFOw@mail.gmail.com> <6842e605-d299-7476-dc15-b27eb7b3bf41@landley.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6842e605-d299-7476-dc15-b27eb7b3bf41@landley.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Landley <rob@landley.net>
Cc: clg@kaod.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Andrew Jeffery <andrew@aj.id.au>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Wed, Jul 4, 2018 at 8:59 PM, Rob Landley <rob@landley.net> wrote:
> On 07/04/2018 12:00 PM, Andy Shevchenko wrote:
>> On Wed, Jul 4, 2018 at 3:46 AM, Rob Landley <rob@landley.net> wrote:

>> No platform data, please.
>
> Why?

Many reasons, starting with "no board files" approach.
Main reason for this particular topic is _unification_ of the access
to the device properties.

> Platform data is what this was using before the device tree migration broke it,
> without regression testing any existing boards using the driver. I just put it
> back to working with the existing structures defined in the existing board file,
> which is as straightforward "undoing the regression" as I can.

I agree that broken patch must be fixed, but I disagree on the approach how.

> I'm happy to migrate the whole thing to device tree, but that's bigger than
> fixing an LED driver regression, and too big a change for this product release.

Did you read my message carefully? Did I mention device tree there?
I'm proposing to move towards unified device properties API to forget
about DT/non-DT/ACPI/non-ACPI/etc property provider.
It's not a driver's business to categorize that crap.

>> So, we have two options here:
>> - use Unified Device Properties API
>> - introduce something like LED_LOOKUP_TABLE (see analogue with GPIO /
>> regulator / PWM)
>>
>> Looking at the platform data LED framework provides I don't see for
>> now a necessity of creating lookup tables (though it might be better
>> choice in long term).
>
> I... don't see that necessity either?
>
> The data structure the driver needed in 4.13 contained all the information
> needed to run the device. The new data structure this driver created locally in
> the C file had no obvious reason to exist, and didn't have visiblity outside the
> driver file despite being the new input format the driver expected. How was that
> thought through?

The author of the change didn't think about legacy platform data
variants for sure, no-one complained that time for already a year(?),
so, what do you expect.
Moreover, I agree with the author on the idea to move out from legacy
platform data.

> The new OF probe is allocating a temporary structure to copy data into from the
> fdt, then feeding the intermediate structure to a probe function that allocates
> _another_ set of structures to copy the data into from there, except the old
> code copied _everything_ into the new structures and the new one is leaving
> gratuitous pointers to the intermediate structures so they can't be freed. How
> does that make sense?

I didn't look at the details of the patch and I can admit that it
might have besides obvious regression (for you) some other non-best
design solutions.

> I have no idea why they did any of this, but I don't see how my patch made it
> worse. What's there is crazy, my fix was to back up to "not crazy". I'm all for
> a better fix on top of that later, but "it works again" is the important bit.

Again, I agree on the "regression must be fixed" and disagree on the
approach you chose.

> (I admit I gave the device tree codepath exactly as much testing as the device
> tree developers gave the platform data codepath, but it should work.)
>
>> For now, you can switch to unified device properties API (basically
>> un-ifdef pca955x_pdata_of_init() and replacing of_* by device_* or
>> fwnode_* compatible calls) and providing a static table of built-in
>> device properties in the platform code in question.
>
> Ah, a static table of built-in device properties. You mean like:
>
> +static struct led_info sh7760_led_info[] = {
> +    { .name = "peer_com" },
> +    { .name = "run" },
> +    { .name = "gen_fault" },
> +    { .name = "bat_fault" },
> +    { .name = "eth_10" },
> +    { .name = "bat_chg" },      /* Used as binary (low active) output */
> +    { .name = "bat_load" },     /* Used as binary (low active) output */
> +    { .name = "bo_on_n" },      /* Used as binary (low active) output */
> +};
> +
> +static struct led_platform_data sh7760_led_platform_data = {
> +    .num_leds = 8,
> +    .leds = sh7760_led_info,
> +};
> +
> +static struct i2c_board_info __initdata sh7760_i2c0_devices[] = {
> +    {
> +        I2C_BOARD_INFO("pca9551", 0x60),    /* Use 7-bit addresses */
> +        .platform_data = &sh7760_led_platform_data,
> +    },
> +};
>
> I.E. the existing format that worked fine back in 3.x?

Feels like similar, but no.

I already pointed out to the examples of provider
(intel_cht_int33fe.c) and if you look into it carefully you will find
the consumers, like fusb302 and max17047.
Moreover, I pointed out to the commit against I2C core to give you a
clue how it's connected between board info and actual consumer.

> I've been trying to clean the board support patches up to get it all posted
> upstream for a couple months now. Porting the product to a reasonably current
> kernel was the first step. (Would have been 4.16 and then 4.17 but the flash
> driver grew a weird data corruption bug in the dev cycle for 4.15 I haven't had
> spare bandwidth to track down yet, it takes about fifteen minutes of jffs2
> stressing to manifest, then you have to reformat the partition.)
>
> I can post a 4.17 version of the patch if you like? (I have to port 3 _other_
> patches to test that version on the actual hardware, and then the filesystem
> will eat itself at some random point because of the flash issue unless that got
> fixed since 4.16, but I can do that thursday if you think it would help?)

I'm sorry I don't follow here.

>> (see include/linux/property.h, for example users of
>> PROPERTY_ENTRY_U*() macros, like arch/arm/mach-pxa/raumfeld.c
>
> Will that work with the driver as-is? Given that the structure the driver is
> taking as external input is local to the driver .c file, I don't see how?

Yes, that's why I pointed to files and commit.

> If an identical structure _is_ present in include/linux/property.h, presumably
> not with the pca955x name in the generic header, then why is leds-pca955x.c
> defining its own local copy of it?

No, unified device properties are driver agnostic. It's a mechanism
how to provide and consume device properties independently on resource
provider (DT/ACPI/legacy platform code).

> And who regression tests keeping the two in sync?

This is not needed as you considered it. It's orthogonal to the
driver. What is needed is to follow device tree bindings correctly in
the driver and in the provider, but this part is being handled by DT
people like Rob Herring.

> Or are you saying "let's create a third format and convert all the existing
> users to something _other_ than device tree"? If so... why?

No.

-- 
With Best Regards,
Andy Shevchenko
