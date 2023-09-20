Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9C1CE79CE
	for <linux-leds@archiver.kernel.org>; Wed, 20 Sep 2023 13:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234771AbjITNkE (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 20 Sep 2023 09:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236133AbjITNkC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 20 Sep 2023 09:40:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19AC1A9;
        Wed, 20 Sep 2023 06:39:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFC9C433C8;
        Wed, 20 Sep 2023 13:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695217196;
        bh=Z6ejmmjRTjZqLnbvfZ8oZxem+kdH68CzZ5r8tDSPkVA=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=PoUwz4Fh01i0saDu8+MZ160+t4E0BW+Kol97RGoAA7DHTezdDsrSPp5MD7uy4sd1l
         ThDbzIakglaWQ6GdDPV0NoH8o/EqV1yGAxaq5eRowqotGOz4crQehkoSZt3620c2wZ
         2MK69ykqngfoIdNC4qTHijpVSmyWqmzKR6hllz0Pl3ORhTTC0zmvc8FFYe6cv6sQnA
         5CqTqmul+EnIMz5WqkBoGVKZilx65+HJ0I+h9OuauPSHOuQaDcsB8Q252jwWVIkAO0
         D0MBDEjSWCEG0lfvMGDK41Z1O7QdHF88jPEsiiG61VjS3BsP6o45U60dN1zzp4Uu3T
         mpCo3Gi6ZAEVA==
From:   Lee Jones <lee@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Kees Cook <keescook@chromium.org>
Cc:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
In-Reply-To: <20230915201010.never.399-kees@kernel.org>
References: <20230915201010.never.399-kees@kernel.org>
Subject: Re: (subset) [PATCH] leds: lm3697: Annotate struct lm3697 with
 __counted_by
Message-Id: <169521719452.3442331.11802360098056654412.b4-ty@kernel.org>
Date:   Wed, 20 Sep 2023 14:39:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 15 Sep 2023 13:10:10 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct lm3697.
> 
> [...]

Applied, thanks!

[1/1] leds: lm3697: Annotate struct lm3697 with __counted_by
      commit: 1a210f7d060854f541be9a613bf942849fd5c0b5

--
Lee Jones [李琼斯]

