Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCD9472F75
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884318; cv=none; b=Wf5Ak5o27+efSkelfgAXsSQs0lGjgJSmAb70v8xRQ+FnBtdL80bEB1R6VD3qDfB2zzmlHyxT7GkfTMxSbbhKgy/EdOfUTzlf6x3T9yqBUCRzjmk/JDT3Vi/68TJHShWJhw31FowJf/K53y6UoywcTDQQjZyyp8+jLi33NrBGUIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884318; c=relaxed/simple;
	bh=iXKHtTcO3OzXfeUrwOHsqSVNmwXV/F74AKan+YlAHVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aasi1GEAtMx07IC7o1GkWB9vhvJQ+M9iYsi2PmorM0aH6tgf33zL6T/yq0KELf0C0J5R4lW7b/V6tKX1+OPLKcUN4ccrE8+Dvucw4uU7La5O+EWAcW0WG0iouzjMUkcucw4Yyt/NYvLhKEO9GZpdQ/O/jpO1sSK/Iv7X5KJ7Oeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/wpZ2d4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/wpZ2d4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afe75f055so2517261f8f.2
        for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 02:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791884315; x=1792489115; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=098vSxKVV3TqG4547pdZNiDtttbybP63ryH0G1e7pgk=;
        b=l/wpZ2d4m0tizSSIaYcthyAMkROwma9GFNZSCQ8Vq8tTBK0G2x7puCz4jYPxE6DIHK
         e6NlLUPFUhaCeYIENVPPuOgUtYtp39RZDXqutHtdhxElyCQaEpzjRsC2sM3AnK4rBD9T
         5mCcJ/2H84pT2fczFi1djALT4+WnvVyffpkFwkJvTWXhld79GhgaTq8xCn2A6sUJxbnW
         +D47YfA9G9q8ETZJfTgfpJtd5sRyEL8W0/EG8yUQNoeuyVqLFPezudY57fZ7/u+9DiKl
         WNhG5HmmDxbcAVAK38f+eq43gbi19alminlL5Tt3Iz7hEkVQP6EJqxkcyfXn+MSNr0Ec
         O0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884315; x=1792489115;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=098vSxKVV3TqG4547pdZNiDtttbybP63ryH0G1e7pgk=;
        b=MQL1yoqwihmYis06eKO15D6yCVH56aih2J0cBSdkfHw/FugV4GVHqmwXYf+xiAQhL9
         XHX6k5/82SeXRpReg1nt9M/vrrhZawl9JqwHTAXvXHv0i7amF7CX85cAqeM834Quyn/v
         L91WH8AXljDSsbMFL4rpCYZGsp/yxRZLQAwfKu6zpijLPU5aGkR6SuEKEaestkxntyGe
         d0yS2lyI8lLNZWLKru7MXhdZuZ3hZynCfZkJUOQqK3qHH/6nxFzsHHfjuogvq6yfbH4x
         zfdPHVTJAOYdB5ey0MvKEq32peYzKFeHuATZyelSc+4h0am4o8q0RwHIfnyTN1C+/57M
         3zUg==
X-Gm-Message-State: AFq9FYI60Ldq4gESz95LtSxXmMLB+Wunz3+3ELr3QM7Vbw/5+yv3Rr7Q
	CSW/IrOcw2FTsVwQS3m1jzhNUzuyXnF1f0BwVhedErX44nwpsN5l/y12
X-Gm-Gg: AYBFou3qPj0127sHupH323wnEHirBNCTBfon56/wZLGjRd2m50KYJ09N4bL23n4NgeC
	Q9Q7xhOLvVV2qS60dNiHtj6pqOJC9yrK7lzO5lmUmZeXY6Zc4U/cCoRAebqQT1XwYCiUZXwzRP2
	V7MdQDKlDBcopGEtJuZQqJ/6l0bIjRmxA7l/YHizMqSrl3fazeRLbElm6FLrlCgljvPGVqy9VT+
	Cy9+c3U2aVIBsHEk44pJ29kWlRPlLgqcy8N39TrA2dsa3MeWMvEwfgAHa0PnnrdKsTYNgu7WGZA
	hBK3m0p/FNBszu9LpemCey6cMyiPzhsJ6qtBMgsl+cHuhfhskYx91dtQUuGUDk0ZopQr2QwuwCj
	DLmYbD25GZSceSeOs+2udyDqkH8eCFTcIhuIpX/3Y1dySTAFcPNP/9LwktIu8eNTdyKwcnzaHRk
	pBNsH/CEVKTWu9cBu87YsbdYfIE4q0lIia3fl04vl5zKL3fl9cBwwz44+COqVcEgmbc6/w1TvUx
	5WhZaOP4/C9iU35kLXTbvGWB9qo6zTy+Apa7qxWirby+lgaKQ==
X-Received: by 2002:a05:600d:82e4:b0:4a1:a49e:a925 with SMTP id 5b1f17b1804b1-4a1a49ea94bmr80614835e9.35.1791884314640;
        Tue, 13 Oct 2026 02:38:34 -0700 (PDT)
Received: from rillian-arch.localnet ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19471edd5sm450468805e9.11.2026.10.13.02.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:38:34 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
Subject:
 Re: [PATCH v3 3/4] leds: flash: lm3643: Describe the LED of ACPI boards
 without LED nodes
Date: Tue, 13 Oct 2026 10:38:33 +0100
Message-ID: <37Wk96VpSLOh-P0MeN457Q@gmail.com>
In-Reply-To: <sashiko-outbox-167402@kernel.org>
References:
 <20261011191026.149338-1-rillian.grant@gmail.com>
 <20261011191026.149338-4-rillian.grant@gmail.com>
 <sashiko-outbox-167402@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

> [Severity: High]
> Is there a potential race condition here when multiple devices probe
> concurrently?
> 
> If two threads execute lm3643_add_dmi_leds() simultaneously (for example,
> during concurrent sysfs bind or async probe of two LM3643 devices matching
> the same DMI table), they both might pass the lockless
> software_node_fwnode(nodes[0]) check before either registers the nodes.

This condition is currently unreachable. It would require two LM3643
instances on the same DMI entry.

I'd be happy to add a static mutex if preferred, or alongside any future
DMI entry for a board with more than one LM3643.

-- 
Rillian Grant


