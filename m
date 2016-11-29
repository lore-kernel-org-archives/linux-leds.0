From: Tin Huynh <tnhuynh@apm.com>
Subject: Re: [PATCH V2] leds: pca963x: Add ACPI support
Date: Tue, 29 Nov 2016 21:47:26 +0700
Message-ID: <CANQ9TuC3EvcjBnQD-trYPxHyJpWww9xNkF7H3poPfDOhnUMFPg@mail.gmail.com>
References: <CGME20161129102236epcas1p36ba8b4160c78cfd62d5748538174ca05@epcas1p3.samsung.com>
 <1480414910-16691-1-git-send-email-tnhuynh@apm.com> <676881f2-07e1-9c77-3559-3cf9832852a6@samsung.com>
 <20161129110400.GY1459@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161129110400.GY1459@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Loc Ho <lho@apm.com>, Thang Nguyen <tqnguyen@apm.com>, Phong Vo <pvo@apm.com>, patches <patches@apm.com>
List-Id: linux-leds@vger.kernel.org

On Tue, Nov 29, 2016 at 6:04 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Tue, Nov 29, 2016 at 11:55:47AM +0100, Jacek Anaszewski wrote:
>> On 11/29/2016 11:21 AM, Tin Huynh wrote:
>> > This patch enables ACPI support for leds-pca963x driver.
>> >
>> > Signed-off-by: Tin Huynh <tnhuynh@apm.com>
>> > ---
>> >  drivers/leds/leds-pca963x.c |   25 ++++++++++++++++++++++++-
>> >  1 files changed, 24 insertions(+), 1 deletions(-)
>> >
>> > Change from V1:
>> >   -Add CONFIG_ACPI.
>> >
>> > diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
>> > index 407eba1..57f11e3 100644
>> > --- a/drivers/leds/leds-pca963x.c
>> > +++ b/drivers/leds/leds-pca963x.c
>> > @@ -25,6 +25,7 @@
>> >   * or by adding the 'nxp,hw-blink' property to the DTS.
>> >   */
>> >
>> > +#include <linux/acpi.h>
>> >  #include <linux/module.h>
>> >  #include <linux/delay.h>
>> >  #include <linux/string.h>
>> > @@ -95,6 +96,17 @@ struct pca963x_chipdef {
>> >  };
>> >  MODULE_DEVICE_TABLE(i2c, pca963x_id);
>> >
>> > +#ifdef CONFIG_ACPI
>> > +static const struct acpi_device_id pca963x_acpi_ids[] = {
>> > +   { "PCA9632", pca9633 },
>> > +   { "PCA9633", pca9633 },
>> > +   { "PCA9634", pca9634 },
>> > +   { "PCA9635", pca9635 },
>> > +   { }
>> > +};
>> > +MODULE_DEVICE_TABLE(acpi, pca963x_acpi_ids);
>> > +#endif
>> > +
>> >  struct pca963x_led;
>> >
>> >  struct pca963x {
>> > @@ -322,7 +334,17 @@ static int pca963x_probe(struct i2c_client *client,
>> >     struct pca963x_chipdef *chip;
>> >     int i, err;
>> >
>> > -   chip = &pca963x_chipdefs[id->driver_data];
>> > +   if (id) {
>> > +           chip = &pca963x_chipdefs[id->driver_data];
>> > +   } else {
>> > +           const struct acpi_device_id *acpi_id;
>> > +
>> > +           acpi_id = acpi_match_device(ACPI_PTR(pca963x_acpi_ids),
>> > +                                           &client->dev);
>>
>> What kind of problem did you get while compiling without ACPI_PTR here,
>> when CONFIG_ACPI is disabled? I also tried this configuration but
>> nothing wrong happened. Also at first glance I don't see why lack of
>> ACPI_PTR macro could cause problems.
>>
>> Grep also doesn't show any call to acpi_match_device
>> with ACPI_PTR as the first argument in the existing drivers.
>
> Indeed, that is not needed at all.
Sorry about that . The PATCH V1 should work fine both with or without
CONFIG_ACPI.
So V1 should be better . Please ignore PATCH V2
