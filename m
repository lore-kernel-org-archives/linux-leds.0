From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 1/3] powerpc/powernv: Add OPAL interfaces for accessing
 and modifying system LED states
Date: Mon, 20 Apr 2015 21:24:45 +0530
Message-ID: <55352145.8060205@linux.vnet.ibm.com>
References: <20150420075558.12371.6697.stgit@localhost.localdomain> <20150420075927.12371.59080.stgit@localhost.localdomain> <55351969.2020604@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e28smtp08.in.ibm.com ([122.248.162.8]:50790 "EHLO
	e28smtp08.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750998AbbDTPyx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 20 Apr 2015 11:54:53 -0400
Received: from /spool/local
	by e28smtp08.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Mon, 20 Apr 2015 21:24:51 +0530
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
	by d28dlp02.in.ibm.com (Postfix) with ESMTP id C9BC83940048
	for <linux-leds@vger.kernel.org>; Mon, 20 Apr 2015 21:24:48 +0530 (IST)
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
	by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t3KFsmTi53411888
	for <linux-leds@vger.kernel.org>; Mon, 20 Apr 2015 21:24:48 +0530
Received: from d28av04.in.ibm.com (localhost [127.0.0.1])
	by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t3KFslUV027864
	for <linux-leds@vger.kernel.org>; Mon, 20 Apr 2015 21:24:48 +0530
In-Reply-To: <55351969.2020604@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org, stewart@linux.vnet.ibm.com, mpe@ellerman.id.au, cooloney@gmail.com, rpurdie@rpsys.net, Benjamin Herrenschmidt <benh@kernel.crashing.org>, khandual@linux.vnet.ibm.com

On 04/20/2015 08:51 PM, Jacek Anaszewski wrote:
> Hi Vasant, Anshuman,
> 

Jacek,


.../...

>> +
>> +/* LED location */
>> +#define LED_LOC_ENCLOSURE    "enclosure"
>> +#define LED_LOC_DESCENDENT    "descendent"
> 
> These macros should also have POWERNV_LED prefix.

Oh yeah.. I should fix this as well. Will fix in next version.

-Vasant
