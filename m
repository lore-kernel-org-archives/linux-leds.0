Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700F4492E5B
	for <linux-leds@vger.kernel.org>; Fri,  9 Oct 2026 08:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533069; cv=pass; b=Pbee/EFBwNbe4r+T0ylgpWL8oLABKiT5rrLmNy3lJ08FLUyib2vSqyNeiRXjgYm+XeGODUXE3MS2gIB2nGwJzs3P1wLBKva5nNQyloLcEyn6HkX7OBp3Rh4hiSfdF59ty4v0G5lzyNHrB6vf1HBLYLM1ZQPxHFg1mM2XMKJEv9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533069; c=relaxed/simple;
	bh=+NsJilTDx1tB947yLQCag6iqhlT3X7wK2H0/heKXVF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcWl7f0Goo84MHBp/qwEkrBJbhhtjMJohCwpfQ3A0Nmyq024Z6psD7rkkL3ds8Ue4ajuEykL7MaO0Biw4Ez3TorjvaedTVebsa9VzTOuFkGMNjtxGUTIFSkMWO4K3GvSBBoD/VzR0BLPWf4+KgV69a83BxnDEXUerqKBrhJ6Tic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3R8WBrK; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3R8WBrK"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-887beafb714so2177314b3a.1
        for <linux-leds@vger.kernel.org>; Fri, 09 Oct 2026 01:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791533064; cv=none;
        d=google.com; s=arc-20260327;
        b=eAj/F9N/F1VLiMxR/Q9IxGhcqX+6vA6WwJVHNqytdTXexyLBsF6VxvenTOKnSbto6n
         fP2z4Y1RrPTibpKAjG8YdD9VTDJG6ITJTgq+kjEmIIn6UvLi8KfAc25CehNd1eZ+Z/Xy
         N6u+4/givUOnrccrr7BmApltDAozFZh9OLa8vfLdtRuBSPJ2t1Rq0bsSMQKGeMrG1/C4
         pDB1ZZyfhnCmqHX0/dmumAsajhftucaLfzebPbI9dRkemPNFuj+sF2tkC8hvCHm8EAfW
         uadgpiR3HeWCOnnvq4WeTQcxDKcVm9dPHwUsAiFrADqaSFT4m/sZBbrCrEfy3eJy5zmK
         U/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sk+wR6aXcuMffQLCDFaHtfSIQHN9wdgT7SWwoWK51p0=;
        fh=+FqfoI2H3fp5bJPUs4MWLUfjZYM1K2DmUWueSc0oa9I=;
        b=dzgeZaxMiqOf0sbt8pdm9GAURbeVcXHxQ7YXubq5bhCWVH7spLUU3MkVV9DsvfE8mf
         +FoDlY7hzPs50uIJNXOE9QmGAxBsYMDeRMTngeUozcJ5+KgaMie6IIbu99JO+P9Q7khD
         9F+hm3Min4K1zc0LdHp80/oeJSCikcGmaS7eqwJB0c/b07MYbwMg5uBNs9K2edzAG4Aa
         oj9R8Kf/tp4l3kAPLyEmxrxREDn+1H5sCGXDl1Cgk+cO0sdrdhMTvtsdONtdsDqRb2/D
         +nCp02q8aF1WLfa8tnLonDD3Tzykf/HBRRtazULLCk01/eHJ/oELPqB+FN8k6T6//d+0
         3O+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791533064; x=1792137864; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sk+wR6aXcuMffQLCDFaHtfSIQHN9wdgT7SWwoWK51p0=;
        b=d3R8WBrKSkorDOcKhs5Hf2YvfNUr16xA9VW6eMbvpuZm51EwK3x5TM1j+RYNfqsS6p
         4aFq6Hu4HXSivn6Ep/RAzUMFfh00gDV1miLpiTvIHG0hEdTt6C2lCrKUx4F+sO/nSaMi
         CaK3WhHegwn2CxEiOvE3nUfwM+TCubK+3NQtGz9eIuHRzTA8mxz3GwooKILfH2dyVLV4
         Oq7AEgHGMFM35kdMw2uySHhRpH0p7Bm3RVvUVkAUXD2284MiKkKDSLkjp6SjFWhO8KZ0
         4pPH8I2EwXJ/IUMMEzIDOUZYoqLnojKTvB5WRRwJVhq5h4MKAZrLAqpw6YYBoHGOSwxh
         wg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533064; x=1792137864;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sk+wR6aXcuMffQLCDFaHtfSIQHN9wdgT7SWwoWK51p0=;
        b=uZ5c63s3XkVAxquVmi1cUzRIr+op7g7ccsxH/7bLgJdpDQEFtQxjOWwGiUBzQdgsvH
         96tC8eNXjCX5C9Q52Si83z2z/VFddvnkTWyddyidaB4rg8msrSCFY3/V9l3XqcHxCUMD
         guSH+9UOKom6bwFBWTOhjUV1jdCxrUKX57He32ZwWRws2Gkb56wv05PHPHYTY/dIXBci
         VlyzYi4f8JX9XlinRI/jxZ38mIYG79os5uPBkLciJus0cAG4hoBcriL1X7/9SoQq5KbW
         jTm/4Ag0pwMEqqDe1FN/ScgLDGJqzyMGD33UCSMMiCJonSjHgkOj9fTVzkzvL9a0SsEG
         EcPA==
X-Forwarded-Encrypted: i=1; AKwUvBwqh/QdEEfKGGfcykaYJyJs1V71iHro4MQGu7rOE/k4TrO+VPhk0ET0HYA3qB+QSielzw+sk0HJgh87@vger.kernel.org
X-Gm-Message-State: AFq9FYJNwgEcf5AZfJQnj7dMbolHHjaErNxob8qPn+N5gc5ur7xuyKHU
	84ZGlExyK6X5DSnlz9o8ElH4rM39gFpH7lTN8bAxqZLOyJr5hqqKE4EJzq5WXMO6HOB5Vxdr9fE
	JMcOJkTmUqtbGTkFWVQyh4u1YyCN/K6SYQtJJ
X-Gm-Gg: AYBFou0tCC8QDU+/HlrvJ3zOyVXS2c/5BNRdtjiwXkXSjyeJffyI8o0AAZ+dHUpx1+u
	SDj3sJfIP6DZ1Ue5vg9SqNQkyBcNNnOa5oKxejeTCyao2EkMlfDjxutr+dreCHQ27t459TZda2U
	08fcnW+p2C/ruOeyTqqPHn8LSh/OpYAy6GaV8s97cNqcvvOCI4jVY2EyJ8Y/5eRoSY8EpYCVpGN
	haUc3JGXCIodjxUPucq9ySBM8ylkV+q5h6jQSXz0JDLobMel2n/suETrGTdKB6pP2ldLaBSZZWH
	Fz3BMEsHCkJIq9KgsxeU3d5NQFsQYt1p/znwVBWURgy8faslfVxBgV6vYsAnsBa/hp1CNaGeOlE
	8qeGToko4VJ/IcXmbG11nrbPsNFcpDiWyWS9lbGbZIuXmIwyoxBBogzBfbqTetHQQ3qs=
X-Received: by 2002:a05:6a00:1798:b0:893:12e5:c07c with SMTP id
 d2e1a72fcca58-897c6d1e604mr938350b3a.27.1791533064649; Fri, 09 Oct 2026
 01:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007104915.507801-1-phucduc.bui@gmail.com> <sashiko-outbox-162904@kernel.org>
In-Reply-To: <sashiko-outbox-162904@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 9 Oct 2026 15:04:11 +0700
X-Gm-Features: AclHuK-qnBNsXh3a9SJEE5vjJ4fa3L9goXv5wKCmekC_mAzheWKs0hVo_QGCQow
Message-ID: <CAABR9nFAk9-PDsb7CDofeKp3DOHH4LLNMJRtjUkP4CeV0f=01A@mail.gmail.com>
Subject: Re: [PATCH] leds: lm3532: propagate enable GPIO errors
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: Low]
> This isn't a bug, but does the commit message subject violate the LED
> subsystem guidelines? The guidelines require the commit message description
> following the subsystem prefix to be capitalized. Should the description
> start with a capital letter?
>

I will update the commit message subject to:
leds: lm3532: Propagate enable GPIO errors


> [Severity: Medium]
> Will this change result in unconditional error logging during deferred probes
> anyway?
>
> When devm_gpiod_get_optional() returns a deferred probe error, dev_err_probe()
> correctly suppresses the log message here. However, the caller lm3532_probe()
> does not use dev_err_probe() for its return check:
>
> lm3532_probe() {
>     ...
>     ret = lm3532_parse_node(drvdata);
>     if (ret) {
>         dev_err(&client->dev, "Failed to parse node\n");
>         return ret;
>     }
>     ...
> }

I will also add this code to the current patch.

--------------------------------------------------------------------------------------------
ret = lm3532_parse_node(drvdata);
if (ret)
        return dev_err_probe(&client->dev, ret, "Failed to parse node\n");
---------------------------------------------------------------------------------------------
