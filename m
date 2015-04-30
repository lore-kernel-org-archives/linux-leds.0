From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 3/3] leds/powernv: Add driver for PowerNV platform
Date: Thu, 30 Apr 2015 20:38:31 +0530
Message-ID: <5542456F.2060904@linux.vnet.ibm.com>
References: <20150428100535.26912.29607.stgit@localhost.localdomain> <20150428101008.26912.38735.stgit@localhost.localdomain> <55423C45.3070601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e23smtp02.au.ibm.com ([202.81.31.144]:58892 "EHLO
	e23smtp02.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751982AbbD3PJ3 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 30 Apr 2015 11:09:29 -0400
Received: from /spool/local
	by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Fri, 1 May 2015 01:09:27 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
	by d23dlp01.au.ibm.com (Postfix) with ESMTP id 175302CE8054
	for <linux-leds@vger.kernel.org>; Fri,  1 May 2015 01:09:26 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t3UF9HrL28639450
	for <linux-leds@vger.kernel.org>; Fri, 1 May 2015 01:09:26 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
	by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t3UF8pQG007215
	for <linux-leds@vger.kernel.org>; Fri, 1 May 2015 01:08:52 +1000
In-Reply-To: <55423C45.3070601@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org, stewart@linux.vnet.ibm.com, j.anaszewski81@gmail.com, benh@kernel.crashing.org, cooloney@gmail.com, rpurdie@rpsys.net, mpe@ellerman.id.au, khandual@linux.vnet.ibm.com

On 04/30/2015 07:59 PM, Jacek Anaszewski wrote:
> Hi Vasant,
> 

Hi  Jacek,

.../...

>> diff --git a/Documentation/devicetree/bindings/leds/leds-powernv.txt
>> b/Documentation/devicetree/bindings/leds/leds-powernv.txt
>> new file mode 100644
>> index 0000000..6bb0e7e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-powernv.txt
>> @@ -0,0 +1,29 @@
>> +Device Tree binding for LEDs on IBM Power Systems
>> +-------------------------------------------------
>> +
>> +The 'led' node under '/ibm,opal' lists service indicators available in the
>> +system and their capabilities.
>> +
>> +led {
>> +    compatible = "ibm,opal-v3-led";
>> +    phandle = <0x1000006b>;
>> +    linux,phandle = <0x1000006b>;
>> +    led-mode = "lightpath";
>> +
>> +    U78C9.001.RST0027-P1-C1 {
>> +        led-types = "identify", "fault";
>> +        led-loc = "descendent";
>> +        phandle = <0x1000006f>;
>> +        linux,phandle = <0x1000006f>;
>> +    };
>> +    ...
>> +    ...
>> +};
>> +
>> +Each node under 'led' node describes location code of FRU/Enclosure.
>> +
>> +The properties under each node:
>> +
>> +  led-types : Supported LED types (attention/identify/fault).
>> +
>> +  led-loc   : enclosure/descendent(FRU) location code.
> 
> DT documentation it usually constructed so that properties are
> described in the beginning and the file ends with an example.
> 
> Also last time I mistakenly requested to remove description of
> compatible property, but it should also be present here and
> the entry should described it in detail, like:
> 
> - compatible : Should be "ibm,opal-v3-led".

That's fine. I will fix it in v5.

> 
> Please refer to the other bindings,
> 
> I will express my opinion on the LED part after powerpc maintainer
> will ack DT bindings.
> 

Sure..

@Ben/Michael,
  Can you please review/ack this patchset?

-Vasant
