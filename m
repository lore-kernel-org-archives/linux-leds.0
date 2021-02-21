Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA06C433E0
	for <linux-leds@archiver.kernel.org>; Sun, 21 Feb 2021 01:56:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E77E764E43
	for <linux-leds@archiver.kernel.org>; Sun, 21 Feb 2021 01:56:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhBUB4P (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 20 Feb 2021 20:56:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:51044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229819AbhBUB4P (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 20 Feb 2021 20:56:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED45F64D73;
        Sun, 21 Feb 2021 01:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613872534;
        bh=T/lM+iL/kFlajZOD+Vm9jufP8yUsCKzJeaVa7Xb//Ik=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EG60aqhTS5rRJ6qRUNm4ABS7JL5HN92g2i/qTE0OicLwXAYNDleTNyeL1gQU2yuKP
         cwbXx7RS2l7Wms3+NIdU+QCUrmGtd0s58t7W5lFDal/UEH2ZvMM+iaXO74Lq6IP39g
         WYL3Xeh5hf/cJYVyU1KBvAyDEUEfWA2muvi4HXdSDtGnqfd44cpqgNK0HnmGF2vzKH
         DP7dzRIubjc5T6/zVZ41pVxdlVtTez5bYp6Sz6+MzxgVde+E965nvgsljOnrs3isaE
         a452Z8umUFc7wKP98mjV0Saptzj0GEvemZKn0rW2OQ3dzI6AceGbL8ZJEh8k4m7bM2
         cPKoYT+dVxIHg==
Date:   Sun, 21 Feb 2021 02:55:30 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, alsa-devel@alsa-project.org,
        Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] leds: trigger: audio: Add an activate callback to
 ensure the initial brightness is set
Message-ID: <20210221025530.3265280d@kernel.org>
In-Reply-To: <20210220124413.23460-1-hdegoede@redhat.com>
References: <20210220124413.23460-1-hdegoede@redhat.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 20 Feb 2021 13:44:13 +0100
Hans de Goede <hdegoede@redhat.com> wrote:

> ledtrig_audio_get() was never actually being send to the hw, leading
being sent
> to the mute LEDs staying in their default power-on state, after
> attaching the keyboard, even if ledtrig_audio_get() returns a different
returned

Otherwise

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>
