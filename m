From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Reading /sys with side effects (was Re: [PATCH 1/2] Documentation:
 leds: Add description of LED Flash class extension)
Date: Mon, 02 Feb 2015 15:51:53 +0100
Message-ID: <54CF8F09.8020203@samsung.com>
References: <1422346028-16739-1-git-send-email-j.anaszewski@samsung.com>
 <20150127221958.GA18993@amd> <54C8A130.8000807@samsung.com>
 <20150129211420.GA21140@amd> <54CB4702.1090508@samsung.com>
 <20150130164027.GA25830@kroah.com> <54CF3E36.9000108@samsung.com>
 <20150202094435.GA6686@amd> <54CF65CB.3060207@samsung.com>
 <20150202135103.GB26985@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60440 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751540AbbBBOv5 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 2 Feb 2015 09:51:57 -0500
In-reply-to: <20150202135103.GB26985@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Greg KH <greg@kroah.com>, kernel list <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com

Hi Pavel,

On 02/02/2015 02:51 PM, Pavel Machek wrote:
> Hi!
>
>>> [Actually, you could _always_ do two reads on those devices, discard
>>> first result, and return the second. But I'm not sure how hardware
>>> will like that.]
>>
>> This would be the most sensible option.
>>
>>
>> However, let's analyze the typical use cases for flash strobing:
>>
>>
>> -------------------------------------------------------------
>>
>>
>>>>>>>>>> Version without faults caching:
>>
>> ============
>> Driver side:
>> ============
>>
>> read_faults()
>> 	faults = read_i2c(); //read faults
>> 	if faults
>> 		write_i2c(); //clear faults, only for some devices
>> 		faults = read_i2c(); //read faults
>> 	return faults
>>
>> ================
>> User space side:
>> ================
>>
>> 1. faults = `cat flash_faults` //read_faults()
>> 2. if faults then
>> 	print "Unable to strobe the flash LED due to faults"
>>     else
>> 	echo 1 > flash_strobe
>>
>>
>>>>>>>>>> Version with faults caching:
>>
>> ============
>> Driver side:
>> ============
>>
>> read_faults()
>> 	faults |= read_i2c(); //read faults
>>
>> clear_faults()
>> 	write_i2c(); //clear faults
>> 	faults = 0;
>>
>>
>> ================
>> User space side:
>> ================
>>
>> 1. faults = `cat flash_faults` //read_faults()
>> 2. if faults then
>> 	echo 0 > flash_faults  //clear_faults()
>> 	faults = `cat flash_faults` //read_faults()
>> 3, if !faults
>> 	echo 1 > flash_strobe
>>     else
>> 	print "Unable to strobe the flash LED due to faults"
>>
>>
>> -------------------------------------------------------------
>>
>>  From the above it seems that version with clearing faults on read
>> results in the simpler flash strobing procedure on userspace side,
>> by the cost of additional bus access on the driver side.
>
> I like caching version more (as it will allow by-hand debugging of
> "why did not flash fire? Aha, lets see in the file, there was fault),
> but both should be acceptable.
>
>> we don't need additional attribute, just writing the flash_faults
>> attribute can do the clearing.
>
> Yes, writing flash_faults to clear is acceptable.

I've been just inspired with another approach:
Faults register is read in the strobe_set callback, right after sending
flash strobe command to the device. The userspace can read the cached
faults through flash_faults attribute.

This way, we avoid reading sysfs attribute with side effect and
gain the possibility of giving immediate feedback to the user.

Exemplary use case:

1. echo 1 > flash_strobe
	write_i2c();		//strobe flash
	faults = read_i2c();	//read faults
	if faults
		return -EINVAL;
	return 0;

2. cat flash_faults
	return faults;	

-- 
Best Regards,
Jacek Anaszewski
