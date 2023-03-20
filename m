Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A74C6FD1D
	for <linux-leds@archiver.kernel.org>; Mon, 20 Mar 2023 14:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbjCTOUm (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 20 Mar 2023 10:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbjCTOUl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Mar 2023 10:20:41 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEDEC1F5E5
        for <linux-leds@vger.kernel.org>; Mon, 20 Mar 2023 07:20:39 -0700 (PDT)
Date:   Mon, 20 Mar 2023 14:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1679322035; x=1679581235;
        bh=Dmhog20iBUZbWLHdDfWPuDym03XHsQpEGJZmSokUkhs=;
        h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=bOBc1Qqc1hJ7SRQjbYpnVS9Y4ez8o1BnNVp92nWnVv/HQeoNATB+XtTSprXG2c9i1
         MvDlgkrE03B4+yyrTyTvEjfkM8aKTTK4vm5JkCMTFSn4BRvy1G/tIbwC6GcRmfWYm3
         cXAi4demotevSBAIJ6CNmmWEkk3ufr7P7RjP3gJzojr4pV2nW74VOl/fRfAcy5QNfT
         gWeLRgmYlH1nThIe+yfOSOax3eCqaxWLYhOE5t/bPBxBhS1X/c7fpFt2bDb313jLLg
         1PxyduFzXmVrW8in0TCmIP+GohZcUossC7eQqogP4Wa5MDd8GA7gYcIpdxvstdjuAV
         SNLHuHw2N2hPQ==
To:     linux-kernel@vger.kernel.org
From:   "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 0/2] leds: aw2013: Add vdd regulator
Message-ID: <20230320141638.3378-1-linmengbo0689@protonmail.com>
Feedback-ID: 40467236:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Implement support for a "vdd" that is enabled by the aw2013 driver so that
the regulator gets enabled when needed.

