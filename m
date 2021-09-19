Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00559C433F5
	for <linux-leds@archiver.kernel.org>; Sun, 19 Sep 2021 20:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0C99610A8
	for <linux-leds@archiver.kernel.org>; Sun, 19 Sep 2021 20:38:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbhISUkN (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 19 Sep 2021 16:40:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:55454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232657AbhISUkK (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 19 Sep 2021 16:40:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEC4660F9D;
        Sun, 19 Sep 2021 20:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632083925;
        bh=JqfnPX2tDV9NuGYYYzCaVzm9En0ofFWMqBpRoJlSagM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PjjFMOUzixJPnMPQaYIX1DoD6CwR7SBSjxktyKad4eDFCAJfeYFpDhUDhvRpS7r8M
         NoqfwBy0rum9Q1sllsQtrfR34OT9Tpzco4pq7sMjXr4YaopVSpHj9uYsaIXqSGlb0c
         ebQSMfYv2ufb6ftSoivFCa5g41w4YkYuDDdMCY+dQWGDqZweHfzB2LS9cGCCQv1Zb1
         kuCitmf0yJM6A8RafT3s01GKnVeIi1egH9nX6kM6BjXtcF59q9BxxRKvwzk9ceBlR5
         aFA9Vg/vYc/kjLiRnJocr/I2nBQ8g45VRle8fJZjNmR6Q2mKY8PlUwFfqEDiK8GcED
         S8El7EwPxxGuQ==
Date:   Sun, 19 Sep 2021 22:38:40 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: document rfkill default action
Message-ID: <20210919223840.55b6c8f2@thinkpad>
In-Reply-To: <20210919151444.68845-1-david@ixit.cz>
References: <20210919151444.68845-1-david@ixit.cz>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 19 Sep 2021 17:14:44 +0200
David Heidelberg <david@ixit.cz> wrote:

> +      - rfkill0

And why does Toshiba AC100 / Dynabook AZ driver need the zero at the
end??

Is this a private trigger? There is no such trigger driver in
drivers/leds/triggrer.

Anyway `linux,default-trigger` property is deprecated. Can't Toshiba
AC100 / Dynabook AZ be merged to the `function` property?

Marek
