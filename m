From: Olliver Schinagl <oliver@schinagl.nl>
Subject: Re: [PATCHv1 0/6] leds: pca9653x: support inverted outputs and
 cleanups
Date: Tue, 19 Apr 2016 11:39:52 +0200
Message-ID: <5715FCE8.7080106@schinagl.nl>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
 <5715F927.3030102@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 7of9.schinagl.nl ([88.159.158.68]:45790 "EHLO 7of9.schinagl.nl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752760AbcDSJj4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 19 Apr 2016 05:39:56 -0400
In-Reply-To: <5715F927.3030102@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Peter Meerwald <pmeerw@pmeerw.net>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

On 19-04-16 11:23, Jacek Anaszewski wrote:
> Hi Olliver,
>
> Thanks for the patches.
> Adding driver authors on cc.
Ah sorry about that, thanks. I guess get_maintainers doesn't do that.

As for the compile bug, I'll fix that with v2, it only applies on the 
intermediate patches, not on the whole set.

Olliver
>
> On 04/19/2016 09:40 AM, Olliver Schinagl wrote:
>> Using the pca963x for a while, I noticed something that may look like 
>> some
>> i2c accessing issues where sometimes data was incorrectly written to 
>> the bus,
>> possibly because we where not properly locking the i2c reads. Though 
>> I'm not
>> familiar enough with the i2c framework to be certain reads need to be 
>> locked
>> at all. A patch was added to properly lock i2c access more tightly.
>>
>> Furthermore there was no method to support inverted outputs. This series
>> adds a property to the device tree to inform the driver that the output
>> is inverted (active-high vs active-low).
>>
>> Additionally, this patch set does some cleanups to please checkpatch, 
>> and
>> removes a few magic values.
>>
>> Olliver Schinagl (6):
>>    leds: pca963x: Alphabetize headers
>>    leds: pca963x: Lock i2c r/w access
>>    leds: pca963x: Add defines and remove some magic values
>>    leds: pca963x: Reduce magic values
>>    leds: pca963x: Inform the output that it is inverted
>>    leds: pca963x: Remove whitespace and checkpatch problems
>>
>>   Documentation/devicetree/bindings/leds/pca963x.txt |   1 +
>>   drivers/leds/leds-pca963x.c                        | 243 
>> ++++++++++++++-------
>>   include/linux/platform_data/leds-pca963x.h         |   1 +
>>   3 files changed, 171 insertions(+), 74 deletions(-)
>>
>
>
