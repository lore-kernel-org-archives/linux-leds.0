From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 3/3] leds/powernv: Add driver for PowerNV platform
Date: Thu, 30 Apr 2015 20:34:23 +0530
Message-ID: <55424477.6070005@linux.vnet.ibm.com>
References: <20150428100535.26912.29607.stgit@localhost.localdomain> <20150428101008.26912.38735.stgit@localhost.localdomain> <5316346.zPr516JNgQ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e28smtp01.in.ibm.com ([122.248.162.1]:55568 "EHLO
	e28smtp01.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751145AbbD3PEc (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 30 Apr 2015 11:04:32 -0400
Received: from /spool/local
	by e28smtp01.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Thu, 30 Apr 2015 20:34:29 +0530
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
	by d28dlp02.in.ibm.com (Postfix) with ESMTP id 8A6B0394005C
	for <linux-leds@vger.kernel.org>; Thu, 30 Apr 2015 20:34:27 +0530 (IST)
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
	by d28relay05.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t3UF4QaC49479828
	for <linux-leds@vger.kernel.org>; Thu, 30 Apr 2015 20:34:26 +0530
Received: from d28av04.in.ibm.com (localhost [127.0.0.1])
	by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t3UF4P0E003167
	for <linux-leds@vger.kernel.org>; Thu, 30 Apr 2015 20:34:26 +0530
In-Reply-To: <5316346.zPr516JNgQ@wuerfel>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org
Cc: linux-leds@vger.kernel.org, stewart@linux.vnet.ibm.com, j.anaszewski81@gmail.com, cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com

On 04/28/2015 03:48 PM, Arnd Bergmann wrote:
> On Tuesday 28 April 2015 15:40:35 Vasant Hegde wrote:
>> +++ b/Documentation/devicetree/bindings/leds/leds-powernv.txt
>> @@ -0,0 +1,29 @@
>> +Device Tree binding for LEDs on IBM Power Systems
>> +-------------------------------------------------
>> +
>> +The 'led' node under '/ibm,opal' lists service indicators available in the
>> +system and their capabilities.
>> +
>> +led {
>> +       compatible = "ibm,opal-v3-led";
>> +       phandle = <0x1000006b>;
>> +       linux,phandle = <0x1000006b>;
>> +       led-mode = "lightpath";
>> +
>> +       U78C9.001.RST0027-P1-C1 {
>> +               led-types = "identify", "fault";
>> +               led-loc = "descendent";
>> +               phandle = <0x1000006f>;
>> +               linux,phandle = <0x1000006f>;
>> +       };
>> +       ...
>> +       ...
>> +};

Arnd,

  Thanks for the review.

> 
> We normally don't list the 'phandle' or 'linux,phandle' properties in the binding
> description.
> 

Sure. .Will fix.


>> +
>> +Each node under 'led' node describes location code of FRU/Enclosure.
>> +
>> +The properties under each node:
>> +
>> +  led-types : Supported LED types (attention/identify/fault).
>> +
>> +  led-loc   : enclosure/descendent(FRU) location code.
>>
> 
> Could you use the standard 'label' property for this?

This was discussed earlier [1] and agreed to use led-types property here..

[1] https://lists.ozlabs.org/pipermail/linuxppc-dev/2015-March/126301.html

-Vasant
