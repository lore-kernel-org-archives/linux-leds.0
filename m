From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/2] leds/powernv: Add driver for PowerNV platform
Date: Tue, 28 Apr 2015 16:36:26 +0530
Message-ID: <553F69B2.1030602@linux.vnet.ibm.com>
References: <20150422234509.626d9dc7@ja.home> <55388254.4000606@linux.vnet.ibm.com> <20150423161342.55e9ac8f@ja.home> <1430086038.16571.78.camel@kernel.crashing.org> <553DE41A.5070703@samsung.com> <1430128435.16571.110.camel@kernel.crashing.org> <553E1A65.5080409@samsung.com> <553E3E06.6070605@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e28smtp09.in.ibm.com ([122.248.162.9]:37672 "EHLO
	e28smtp09.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964921AbbD1LGl (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 28 Apr 2015 07:06:41 -0400
Received: from /spool/local
	by e28smtp09.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Tue, 28 Apr 2015 16:36:38 +0530
Received: from d28relay01.in.ibm.com (d28relay01.in.ibm.com [9.184.220.58])
	by d28dlp03.in.ibm.com (Postfix) with ESMTP id E368B1258056
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2015 16:38:36 +0530 (IST)
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
	by d28relay01.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t3SB6SV536307096
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2015 16:36:28 +0530
Received: from d28av01.in.ibm.com (localhost [127.0.0.1])
	by d28av01.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t3SB6QPl009310
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2015 16:36:27 +0530
In-Reply-To: <553E3E06.6070605@linux.vnet.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: stewart@linux.vnet.ibm.com, cooloney@gmail.com, rpurdie@rpsys.net, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org, khandual@linux.vnet.ibm.com

On 04/27/2015 07:17 PM, Vasant Hegde wrote:
> On 04/27/2015 04:45 PM, Jacek Anaszewski wrote:
>> On 04/27/2015 11:53 AM, Benjamin Herrenschmidt wrote:
>>> On Mon, 2015-04-27 at 09:24 +0200, Jacek Anaszewski wrote:
>>>> I was not aware that some other entity than the driver could be
>>>> interested in the information provided by DT node. I will no longer
>>>> object, provided that we will get an ack from DT maintainer.
>>>
> 
> Jacket,

Oops.. Sorry..  It was a typo .. I meant Jacek..


-Vasant
