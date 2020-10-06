Return-Path: <SRS0=pLuE=DN=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92282C47095
	for <linux-leds@archiver.kernel.org>; Tue,  6 Oct 2020 07:34:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D25F220760
	for <linux-leds@archiver.kernel.org>; Tue,  6 Oct 2020 07:34:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=blackhole.sk header.i=@blackhole.sk header.b="NHpJ+zwA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgJFHeB (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 6 Oct 2020 03:34:01 -0400
Received: from mail-proxyout-mua-31.websupport.eu ([37.9.172.181]:36839 "EHLO
        mail-proxyout-mua-31.websupport.eu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725912AbgJFHeB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Oct 2020 03:34:01 -0400
Received: from in-6.websupport.sk (unknown [10.10.2.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail-proxyout-mua-31.websupport.eu (Postfix) with ESMTPS id E961FBD950;
        Tue,  6 Oct 2020 09:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blackhole.sk;
        s=mail; t=1601969638;
        bh=g16ndeR1v5UyIw6wOFXSrYYQyb7E3w7vC+bVV8Uebfc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=NHpJ+zwAbbf459X1ipY0xENkVig+15g8Lj3v6r3KH1aMEygwHGzsFaI7Rot0JupkX
         W8Hx83WeEaRiWSSdsDMx1D5Ii3mztLayt4NVzJmXJDEMttxAoHz8cLe6de/wgPqdcP
         pYoVYsUtJtRcnoPu4imbI9EA0z6Hr2YvcHocvHyU=
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kabel@blackhole.sk)
        by in-6.websupport.sk (Postfix) with ESMTPSA id 4C58NP4NdKz12N53;
        Tue,  6 Oct 2020 09:33:57 +0200 (CEST)
Date:   Tue, 6 Oct 2020 09:33:56 +0200
From:   Marek Behun <kabel@blackhole.sk>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     ultracoolguy@tutanota.com, Alexander Dahl <post@lespocky.de>,
        Dmurphy <dmurphy@ti.com>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux Leds <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
Message-ID: <20201006093356.6d25b280@blackhole.sk>
In-Reply-To: <20201005173227.GA6431@duo.ucw.cz>
References: <MIiYgay--3-2@tutanota.com>
        <20201005141334.36d9441a@blackhole.sk>
        <MIt2NiS--3-2@tutanota.com>
        <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com>
        <MItBqjy--3-2@tutanota.com>
        <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com>
        <MItOR9Z--3-2@tutanota.com>
        <20201005164808.slrtmsvmw4pvwppm@falbala.internal.home.lespocky.de>
        <MItjEho--3-2@tutanota.com>
        <20201005173227.GA6431@duo.ucw.cz>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Out-Rspamd-Queue-Id: 4C58NP4NdKz12N53
Authentication-Results: in-6.websupport.sk;
        auth=pass smtp.auth=kabel@blackhole.sk smtp.mailfrom=kabel@blackhole.sk
X-Out-Rspamd-Server: mail-antispam-5
X-Out-Spamd-Result: default: False [-3.10 / 24.00];
         ARC_NA(0.00)[];
         GENERIC_REPUTATION(0.00)[-0.57995165379285];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         RCPT_COUNT_FIVE(0.00)[6];
         FUZZY_BLOCKED(0.00)[rspamd.com];
         RCVD_COUNT_ZERO(0.00)[0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:2852, ipnet:78.128.128.0/17, country:CZ];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-3.00)[99.99%]
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

By the way I just realized that the DT binding in this driver seems
incorrect to me.

The controller logically supports 3 LED strings, each having
configurable control bank.

But the DT binding supports 2 DT nodes, one for each control bank
(identified by the `reg` property) and then `led-sources` says which
string should be controlled by given bank.

But taking in mind that DT should describe how devices are connected to
each other, I think the child nodes in the binding should instead
describe the 3 supported LED strings...

Marek
