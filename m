Return-Path: <SRS0=niSq=VW=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1A9C76190
	for <linux-leds@archiver.kernel.org>; Thu, 25 Jul 2019 19:43:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CBE4218EA
	for <linux-leds@archiver.kernel.org>; Thu, 25 Jul 2019 19:43:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=philipmolloy.com header.i=@philipmolloy.com header.b="lE3/SXCA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfGYTna (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 25 Jul 2019 15:43:30 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:39978 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbfGYTna (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Jul 2019 15:43:30 -0400
Date:   Thu, 25 Jul 2019 19:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philipmolloy.com;
        s=protonmail; t=1564083807;
        bh=Impig46RPhcQIsGbzQZJgKYorn7l5BDRZSY+LL39yYw=;
        h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
        b=lE3/SXCA6C9aPxqJNtuTPJzJ1MJ4snLLbi0TOU4orPicJv4GTwz1WUDiVQf2hwPb6
         i9WjJKuwJY1UgkN+xMV5GwYfBCU19451iuOQSnG+DtKJ/64dR2meWEv2T02d9UH3Tg
         cmu1l5Y2toq/K9bDfoTOdDK4DVMLQ6m4noq0tdIw=
To:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
From:   Philip Molloy <philip@philipmolloy.com>
Reply-To: Philip Molloy <philip@philipmolloy.com>
Subject: Abstraction for dual LED driver override feature
Message-ID: <-SZHSFMkCZILLVhmVPIa2HVHWpZN2OId3iixPCrsBNWCmtyC2bt5ATy3iOTlNuD_12k6xRBcXwUf7_WT3Ij7ccp0357LdxUUSjojm2_LFUc=@philipmolloy.com>
Feedback-ID: GJt-tMfvxqs0QQBY3TE43pQhGJvmgUyYcaVNLwpOk7zQA3Z8eEn7lfwmGEZNv6-1MJvpWrQYi2j-a_XpfopQjA==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

I'm writing a driver for the TI LM3644 dual current flash LED driver[1] and=
 could use some advice on how to abstract a feature of the device that allo=
ws the user to fix the brightness of the 2nd LED to the brightness of the 1=
st.

Bit 7 of the LED1 torch brightness register signifies whether the LED2 torc=
h current should be set to the LED1 torch current. By default this override=
 is enabled.

Is it worth exposing this feature to userspace? And what might a good way t=
o do that be?

Or alternatively, hide the feature by setting bit 7 of the LED1 torch brigh=
tness register to 0 every time I write to the LED2 torch brightness registe=
r?

Unfortunately, I couldn't find an example of similar functionality in any o=
f the mainline LED kernel modules.

Best,
Philip

[1]: http://www.ti.com/lit/ds/symlink/lm3644.pdf
