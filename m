From: Tony <tony.makkiel@daqri.com>
Subject: Re: [PATCH v5 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Mon, 27 Jun 2016 11:12:28 +0100
Message-ID: <5770FC0C.4020402@daqri.com>
References: <1465815119-7511-1-git-send-email-tony.makkiel@daqri.com>
 <1833687.53qtq4DcBM@vostro.rjw.lan>
 <20160627075322.GR1718@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:35771 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750869AbcF0KMb (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 27 Jun 2016 06:12:31 -0400
Received: by mail-wm0-f53.google.com with SMTP id v199so93519704wmv.0
        for <linux-leds@vger.kernel.org>; Mon, 27 Jun 2016 03:12:30 -0700 (PDT)
In-Reply-To: <20160627075322.GR1718@lahna.fi.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net

Thank you Mika for the comments. I shall make the changes and send 
updated patch.


On 27/06/16 08:53, Mika Westerberg wrote:
> On Fri, Jun 24, 2016 at 03:51:14PM +0200, Rafael J. Wysocki wrote:
>>> +#ifdef CONFIG_ACPI
>>> +static const struct acpi_device_id lp3952_acpi_match[] = {
>>> +	{LP3952_NAME, 0},
>>
>> The above line is not necessary AFAICS.  Mika?
>
> Indeed, it should not be there.
>
>>> +	{LP3952_ACPI_NAME, 0},
>>> +	{}
>>> +};
>>> +
>>> +MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
>>> +#endif
>>> +
>>> +static struct i2c_driver lp3952_i2c_driver = {
>>> +	.driver = {
>>> +		   .name = LP3952_NAME,
>>> +		   .owner = THIS_MODULE,
>>> +#ifdef CONFIG_ACPI
>>> +		   .acpi_match_table = ACPI_PTR(lp3952_acpi_match),
>>> +#endif
>
> Also this #ifdeffery is not needed either.
>
>>> +		   },
>>> +	.probe = lp3952_probe,
>>> +	.remove = lp3952_remove,
>>> +	.id_table = lp3952_id,
>>> +};
