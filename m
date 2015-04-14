From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/2] leds/powernv: Add driver for PowerNV platform
Date: Tue, 14 Apr 2015 11:10:30 +0530
Message-ID: <552CA84E.50705@linux.vnet.ibm.com>
References: <20150320105921.14866.83209.stgit@localhost.localdomain> <20150320110328.14866.98225.stgit@localhost.localdomain> <1427260873.6468.68.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e23smtp05.au.ibm.com ([202.81.31.147]:59263 "EHLO
	e23smtp05.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751596AbbDNFl1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 14 Apr 2015 01:41:27 -0400
Received: from /spool/local
	by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Tue, 14 Apr 2015 15:41:24 +1000
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id ACF1D357804C
	for <linux-leds@vger.kernel.org>; Tue, 14 Apr 2015 15:41:21 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t3E5fD2R46596346
	for <linux-leds@vger.kernel.org>; Tue, 14 Apr 2015 15:41:21 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
	by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t3E5el1e024837
	for <linux-leds@vger.kernel.org>; Tue, 14 Apr 2015 15:40:48 +1000
In-Reply-To: <1427260873.6468.68.camel@kernel.crashing.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org, stewart@linux.vnet.ibm.com, khandual@linux.vnet.ibm.com

On 03/25/2015 10:51 AM, Benjamin Herrenschmidt wrote:
> On Fri, 2015-03-20 at 16:34 +0530, Vasant Hegde wrote:
>> From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
>>
>> This patch implements LED driver for PowerNV platform using the existing
>> generic LED class framework. It registers classdev structures for all
>> individual LEDs detected on the system through LED specific device tree
>> nodes. Device tree nodes specify what all kind of LEDs present on the
>> same location code. It registers LED classdev structure for each of them.
>>
>> The platform level implementation of LED get and set state has been
>> achieved through OPAL calls. These calls are made available for the
>> driver by exporting from architecture specific codes.
>>
>> As per the LED class framework, the 'brightness_set' function should not
>> sleep. Hence these functions have been implemented through global work
>> queue tasks which might sleep on OPAL async call completion.
>>
>> All the system LEDs can be found in the same regular path /sys/class/leds/.
>> There are two different kind of LEDs present for the same location code,
>> one being the identify indicator and other one being the fault indicator.
>> We don't use LED colors. Hence our LEDs have names in this format.
>>
>>         <location_code>:<ATTENTION|IDENTIFY|FAULT>
>>
>> Any positive brightness value would turn on the LED and a zero value
>> would turn off the LED. The driver will return LED_FULL (255) for any
>> turned on LED and LED_OFF for any turned off LED.
> 

Bryan, Richard,

  Did you get a chance to review this patchset?

-Vasant

> Any comment from the LEDs folks ? I am not too familiar with the LED
> subsystem so I would appreciate at least a cursory review of the high
> level design :-)
