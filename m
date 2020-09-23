Return-Path: <SRS0=kkVv=DA=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A33C4727E
	for <linux-leds@archiver.kernel.org>; Wed, 23 Sep 2020 14:18:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B547A21D92
	for <linux-leds@archiver.kernel.org>; Wed, 23 Sep 2020 14:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600870734;
	bh=63pzL52BuKoPTueMiUQfMC6VAD74d2VbT76DZ6fShzY=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=IEY0DFHWhGLwhPogmuP+zjVFOvdvq+IgTvWIWNu49n4vXJwKEI+/VZp8BSAx79GEF
	 L8aYRPzMGH8Zbkb6OPsaVBgWPSxknEEpycmvC9XXRS0nm+Fq0RKdA8gt3XYknCrrWJ
	 rxBeCqStO/Sb4/cI2nboU9N5Aocn+Ir03qr4bOfs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgIWOSy (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 23 Sep 2020 10:18:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:58092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgIWOSy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 23 Sep 2020 10:18:54 -0400
Received: from dellmb.labs.office.nic.cz (nat-1.nic.cz [217.31.205.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A3D9921D43;
        Wed, 23 Sep 2020 14:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600870733;
        bh=63pzL52BuKoPTueMiUQfMC6VAD74d2VbT76DZ6fShzY=;
        h=From:To:Cc:Subject:Date:From;
        b=aKrFaOY1QgpKgN3pFTFmbYq1Hvt9PMUpjK0AvGIVpMZ6tobnTa58ESYjOPvI8/B24
         AjZhmdbiT33PZUtGAi3g+dagn0CrQInXObESDzAFWZgjSFH55czj66da8nQB4CjObU
         Doc8CFSF0HcGhdMXV6n7L0sqZ+L3zgV0SHLppTts=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, dmurphy@ti.com,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Simon Guinot <simon.guinot@sequanux.org>
Subject: [PATCH leds 0/2] leds: ns2: convert to fwnode API
Date:   Wed, 23 Sep 2020 16:18:38 +0200
Message-Id: <20200923141840.6333-1-kabel@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

Simon wants to bind this driver without device-tree, so this changes
the binding from specific OF API to generic fwnode API.

This applies to your for-next, but if you apply this, I will have to
respin my other series moving parsing of `linux,default-trigger` to
LED core.

Marek

Cc: Simon Guinot <simon.guinot@sequanux.org>

Marek Behún (2):
  leds: ns2: convert to fwnode API
  leds: ns2: do not guard OF match pointer with of_match_ptr

 drivers/leds/leds-ns2.c | 74 ++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 38 deletions(-)

-- 
2.26.2

