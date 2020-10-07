Return-Path: <SRS0=0K9/=DO=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91D1C4363D
	for <linux-leds@archiver.kernel.org>; Wed,  7 Oct 2020 12:17:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65AF620789
	for <linux-leds@archiver.kernel.org>; Wed,  7 Oct 2020 12:17:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728146AbgJGMRa (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 7 Oct 2020 08:17:30 -0400
Received: from lists.nic.cz ([217.31.204.67]:47452 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728129AbgJGMRa (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 7 Oct 2020 08:17:30 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id CD3D8140AA3;
        Wed,  7 Oct 2020 14:17:27 +0200 (CEST)
Date:   Wed, 7 Oct 2020 14:17:27 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Message-ID: <20201007141727.71ee4e8b@nic.cz>
In-Reply-To: <DM6PR12MB3898A52EC09BDD408A6029B7AF0A0@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20201006165850.17790-1-vadimp@nvidia.com>
        <20201007011527.420e03b2@nic.cz>
        <DM6PR12MB3898A52EC09BDD408A6029B7AF0A0@DM6PR12MB3898.namprd12.prod.outlook.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 7 Oct 2020 06:07:23 +0000
Vadim Pasternak <vadimp@nvidia.com> wrote:

> mlx-platform activates tens other platform drivers.
> So this is a huge change, which will require huge amount
> of new definitions for DT API - actually if will be register
> map description at bit granularity.
> 
> I can think about it for the future.
> 
> Which real benefits you see from such move?
> Currently all our system are based on x86 arch.
> 
> Vadim.

Okay, it seems that would be a huge change, so never mind.
I was asking because the LED core constructs LED labels itself if there
are specific properties in device tree.

Marek
