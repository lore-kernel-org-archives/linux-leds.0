Return-Path: <SRS0=kD89=DV=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B06C433E7
	for <linux-leds@archiver.kernel.org>; Wed, 14 Oct 2020 08:29:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D1D820BED
	for <linux-leds@archiver.kernel.org>; Wed, 14 Oct 2020 08:29:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q4rL/F2A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbgJNI3e (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 14 Oct 2020 04:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728357AbgJNI3d (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Oct 2020 04:29:33 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27AA7C041E74;
        Tue, 13 Oct 2020 21:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=yGwm+FYf1veFap07M7lkxRVGaScE5egn/D1JUgzguhg=; b=Q4rL/F2ADS2XBPMl//gX5IiWbo
        g1pSgZ1cMBOhCSYts36M97tS7csbaZd1jzpX1Nc91e8sAj01jxiv5Yp/Iyed6+BDq/LBm/zNdetWc
        O19XG3OQ52CPXeRVLFouo0ixmbSnT3z0boTKKSli/FQZpKH5T1q3Ee7viIQtfgRKwCJhBEV0h9N3S
        CMgek8dxTvPc18V6tRqDplmfg0D+cFK+iB7xthhYOLdvBWOMb9B/Rma/a7hE14GdR+Vaa3/Z8/LDg
        rl85RnX/ND+USirofs66TwmtF4Qg7S4mqVEq/ZHJgLakOtwRL+ZI+XS9rYrLoLoOBI6z7FaXbFNeN
        l8Amab6g==;
Received: from [2601:1c0:6280:3f0::507c]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kSYjF-00062K-2M; Wed, 14 Oct 2020 04:49:33 +0000
Subject: Re: disabling CONFIG_LED_CLASS
To:     Udo van den Heuvel <udovdh@xs4all.nl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Pavel Machek <pavel@ucw.cz>
References: <2835d02a-380b-6a3a-0e4d-abf07aee18bc@xs4all.nl>
 <53e698c1-86e4-8b1f-afb0-b8471349e701@xs4all.nl>
 <43b79598-1592-683f-46df-9e5489110780@infradead.org>
 <6fd1e91e-19d0-6682-dfc6-49f1cd60408b@infradead.org>
 <3c6d174c-30db-3d03-3d16-42df405f38d9@xs4all.nl>
 <58e774c5-fc80-2060-2091-9a6398582cc5@infradead.org>
 <9fc679e9-e9a9-ad80-b24c-f04489b98aa7@xs4all.nl>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <27e159be-4376-e87b-5e60-803bc3749ec2@infradead.org>
Date:   Tue, 13 Oct 2020 21:49:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9fc679e9-e9a9-ad80-b24c-f04489b98aa7@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/13/20 9:39 PM, Udo van den Heuvel wrote:
> On 14-10-2020 06:34, Randy Dunlap wrote:
>> On 10/13/20 9:29 PM, Udo van den Heuvel wrote:
>>> So we still are stuck.
> 
> (...)
> 
> 
>> Please post your .config file.
> 
> Attached to this message.
> This is the version stripped from LED references.

This is the problem:

config SND_HDA_CODEC_REALTEK
	tristate "Build Realtek HD-audio codec support"
	select SND_HDA_GENERIC
	select SND_HDA_GENERIC_LEDS

If you disable SND_HDA_CODEC_REALTEK, then the rest of the
LED kconfig symbols can be disabled.

lnx-59> grep LEDS xx64/.config
# CONFIG_NEW_LEDS is not set




-- 
~Randy

