From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/configs: Enable LEDS support
Date: Wed, 26 Aug 2015 09:46:03 +0530
Message-ID: <55DD3D83.5020406@linux.vnet.ibm.com>
References: <1440489254-8162-1-git-send-email-hegdevasant@linux.vnet.ibm.com> <m3a8teopy3.fsf@oc8180480414.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e23smtp02.au.ibm.com ([202.81.31.144]:44681 "EHLO
	e23smtp02.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750979AbbHZERG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 26 Aug 2015 00:17:06 -0400
Received: from /spool/local
	by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Wed, 26 Aug 2015 14:17:04 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id 4DDD93578047
	for <linux-leds@vger.kernel.org>; Wed, 26 Aug 2015 14:17:02 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t7Q4Gl8M59637818
	for <linux-leds@vger.kernel.org>; Wed, 26 Aug 2015 14:16:55 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
	by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t7Q4GTe5031116
	for <linux-leds@vger.kernel.org>; Wed, 26 Aug 2015 14:16:29 +1000
In-Reply-To: <m3a8teopy3.fsf@oc8180480414.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stewart Smith <stewart@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: j.anaszewski@samsung.com, linux-leds@vger.kernel.org

On 08/26/2015 05:56 AM, Stewart Smith wrote:
> Vasant Hegde <hegdevasant@linux.vnet.ibm.com> writes:
>> Presently PowerNV LEDS driver is specific to FSP based PowerNV
>> platform. Hence added it as 'm'. So that we will be loaded only
>> if we have required device tree support.

Stewart,

> 
> Currently the *firmware* support is FSP specific.
> 
> The driver should magically work on any OPAL machine that hooks up the
> OPAL calls and DT. Right?

Yep. It will just work if we have appropriate device tree . I'll update the
description and resend patch.


> 
> The A in OPAL is for Abstraction, not P for Passthrough-to-fsp.
> 

:-)

-Vasant
