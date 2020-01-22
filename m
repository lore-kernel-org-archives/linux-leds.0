Return-Path: <SRS0=tdXK=3L=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57C4C32771
	for <linux-leds@archiver.kernel.org>; Wed, 22 Jan 2020 21:05:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B676D2467A
	for <linux-leds@archiver.kernel.org>; Wed, 22 Jan 2020 21:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579727108;
	bh=kG72OobOMoKoOM9E0wEFPVR4W6Lb5CW8UUhHMeprrgA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=KnH13xvlPi8mSaUleMxSiQPBs5Y1cxIcVj8FDr04oIKoKNmO+Xl0Ip9dPsrFhcA6h
	 rJEyenc7+fqL47sq092sCdRsyb3ZxzpwrAEtAwSpx5GyQ0cQeEhuW988W+Fn2G+tH+
	 LCp+rwXrPHEiq3XEJkTIstcbFUUG7CDWbT97bbaY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbgAVVFF (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 22 Jan 2020 16:05:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:56462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727590AbgAVVFE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 22 Jan 2020 16:05:04 -0500
Subject: Re: [GIT PULL] LEDs changes for 5.5-rc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579727103;
        bh=kG72OobOMoKoOM9E0wEFPVR4W6Lb5CW8UUhHMeprrgA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Ts9JCQfFfLDN8aG6F1BEd0bwNBhJcp9cHykhlWSI3GIfesqpNJAUaHptNhLBKgJWH
         FCLlCflmedlrneXDZlTI9P3pevqU9BZq49k3nsccIklDNr/9fw5v/O/CEaRKhLNkgH
         72AZWb5jV7JoZSvQfWGCAA4RQyn4DAsIjueApzcA=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200122201711.GA29496@amd>
References: <20200122201711.GA29496@amd>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200122201711.GA29496@amd>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/
 tags/leds-5.5-rc8
X-PR-Tracked-Commit-Id: 43108c72cf1d518f3ce62d3b1c8a9ffa38ddc28b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 131701c697e85d5d0726e6152219359639fae98f
Message-Id: <157972710363.17393.6526795152010055514.pr-tracker-bot@kernel.org>
Date:   Wed, 22 Jan 2020 21:05:03 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Wed, 22 Jan 2020 21:17:11 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.5-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/131701c697e85d5d0726e6152219359639fae98f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
