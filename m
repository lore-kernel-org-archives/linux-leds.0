From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 2/2] leds/powernv: Add driver for PowerNV platform
Date: Tue, 28 Apr 2015 11:10:08 +0200
Message-ID: <553F4E70.3020604@samsung.com>
References: <20150422234509.626d9dc7@ja.home>
 <55388254.4000606@linux.vnet.ibm.com> <20150423161342.55e9ac8f@ja.home>
 <m3egnama5l.fsf@oc8180480414.ibm.com> <20150424121629.69a159b3@ja.home>
 <m3zj5slovt.fsf@oc8180480414.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:20527 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933218AbbD1JKL (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 28 Apr 2015 05:10:11 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NNI00KFAESX5H10@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Tue, 28 Apr 2015 10:10:09 +0100 (BST)
In-reply-to: <m3zj5slovt.fsf@oc8180480414.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: Jacek Anaszewski <j.anaszewski81@gmail.com>, linux-leds@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, linuxppc-dev@lists.ozlabs.org, khandual@linux.vnet.ibm.com

On 04/28/2015 08:59 AM, Stewart Smith wrote:
> Jacek Anaszewski <j.anaszewski81@gmail.com> writes:
>> Is the DT node we are discussing used by some other drivers than the
>> LED class driver? Or is it required in this form by other components of
>> your platform?
>
> OS kernels are the chief consumers, Linux being the overwhelmingly major
> one here.
>
> But this is what firmware currently produces.
>
> Changing the DT representation at this stage is perhaps *possible*
> without creating a bunch of pain (I'd have to audit a bunch of things to
> see if we have GA shipping systems with this functionality for instance,
> and then evaluate the impact to partners and our various labs) which is
> a lot of work I don't particularly want to do and is well below urgent
> item 248 on my TODO list, especially for what seems to be largely a
> cosmetic suggestion?
>
> That being said, more and better review of things we're putting in the
> device tree in firmware is probably a good thing. After all, once we
> release we do kind of have to live with it essentially forever. If
> people are able to aid in that kind of code review, I'd be most welcome
> to hear it.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

As we agreed with Ben - DT bindings are platform specific and they will
have to be acked by powerpc maintainers. I have only DT related
experience from ARM based platforms, but it seems not to be applicable
to powerpc.

-- 
Best Regards,
Jacek Anaszewski
