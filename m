Return-Path: <SRS0=/T0w=DP=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CB9C43467
	for <linux-leds@archiver.kernel.org>; Thu,  8 Oct 2020 08:55:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47E6B21775
	for <linux-leds@archiver.kernel.org>; Thu,  8 Oct 2020 08:55:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbgJHIzx (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 8 Oct 2020 04:55:53 -0400
Received: from lists.nic.cz ([217.31.204.67]:46940 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgJHIzw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 8 Oct 2020 04:55:52 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 06BD813FFB6;
        Thu,  8 Oct 2020 10:55:51 +0200 (CEST)
Date:   Thu, 8 Oct 2020 10:55:50 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Message-ID: <20201008105550.44fa3165@nic.cz>
In-Reply-To: <DM6PR12MB389877E86421231E18EF7DCDAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20201006165850.17790-1-vadimp@nvidia.com>
        <20201007113105.GE12224@duo.ucw.cz>
        <20201007142049.02d8c3ba@nic.cz>
        <DM6PR12MB38986A442F12A2DFB5769235AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
        <20201008075619.GB32424@amd>
        <DM6PR12MB389877E86421231E18EF7DCDAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 8 Oct 2020 08:47:45 +0000
Vadim Pasternak <vadimp@nvidia.com> wrote:

> > 
> > But noone is currently using mlxreg123 in their applications, so that part is not
> > going in.  
> 
> Yes, this is true.
> I could modify it as:
> 
> 		if (priv->pdev->id > 0)
> 			sprintf(led_data->led_cdev_name, "%s%d:%s", "card",
> 				priv->pdev->id, data->label);
> 		else
> 			sprintf(led_data->led_cdev_name, "%s:%s", "mlxreg",
> 				data->label);
> 

Vadim, the LED core constructs names in form
  device:color:function-enumerator
so if you must have number there, IMO it should be
  mlxreg:green:status-48
  mlxreg:green:status-56
  ...

Marek
