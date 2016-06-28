From: Tony <tony.makkiel@daqri.com>
Subject: Re: [PATCH v6 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Tue, 28 Jun 2016 17:01:35 +0100
Message-ID: <57729F5F.9000809@daqri.com>
References: <1467107065-11338-1-git-send-email-tony.makkiel@daqri.com>
 <20160628144254.GL1711@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:35187 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752058AbcF1QBi (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 28 Jun 2016 12:01:38 -0400
Received: by mail-wm0-f43.google.com with SMTP id v199so146082981wmv.0
        for <linux-leds@vger.kernel.org>; Tue, 28 Jun 2016 09:01:38 -0700 (PDT)
In-Reply-To: <20160628144254.GL1711@lahna.fi.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net, rjw@rjwysocki.net, lenb@kernel.org



On 28/06/16 15:42, Mika Westerberg wrote:
> On Tue, Jun 28, 2016 at 10:44:25AM +0100, Tony Makkiel wrote:
>> +#ifdef CONFIG_ACPI
>> +static const struct acpi_device_id lp3952_acpi_match[] = {
>> +	{LP3952_ACPI_NAME, 0},
>> +	{}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
>> +#endif
>
> Do you actually have ACPI system with this device included or are you
> just making this up? If there is no such system please consider dropping
> ACPI probing support from the driver. It can be added later if actually
> found on some real system.

Yes, I do have an ACPI system :).
>
