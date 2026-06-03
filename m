Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B89E47F2FD
	for <linux-leds@vger.kernel.org>; Wed,  3 Jun 2026 12:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490838; cv=none; b=qIYLoZIsL52HNHskqgrsiG+lP2PorHF+c3NNcNiw7YE8LdDW0YICCGSXPz2uk5lZhP2F30oT0hCWJb2HGGQ85htQ5+je/1fBK8tpbDDp9yiu5ul8OKbppp/lpnDn2y9KdU8nln+Lhpm+2Ri4bwO3pVQPv7HzDcCDLWLkZ6CzXBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490838; c=relaxed/simple;
	bh=UqiTc5uJeCStJmC9RpnHPzx217mtLCKEuO3YakKuRZo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JO28gav9w4iQJRP50PaHTA7w5XejRNDZ+awipRq2uOtoh9iptvB1D5WOWwSitq4YyLsZLFvakIMp3yYGBZcFF7Y35/6fr1pNdCRph3jEg2ao+VsfOQ7t5pYoAMlYF3DP5DCMk5txXSNEQ6c3vvfl0B+6C6r2ecR52qSxQUC/zu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=G18ErR6B; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="G18ErR6B"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bec3f69d343so528165866b.0
        for <linux-leds@vger.kernel.org>; Wed, 03 Jun 2026 05:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1780490833; x=1781095633; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=C8IHtiFTYRJaSwK/lgA40BX6+K7NCg68jEs/RoM3v8w=;
        b=G18ErR6BEly0K+5NGJfw9qWzr+KWN6yubENy+7Mt+bNF1Wc+DuGuwO1iL4l18AMwie
         6AVRrUM+tXw8Gj+0wattnN32jlCeOcO6QM0GlbEyEgV09DHGBLqmVew6EL0HGybHipFq
         ZRH0rDV0WhLv/rx8KcnWnaNlohdiXG9DqTtwjlHtCjTQ4H05ouGYhNe2qdDmXXO5vBEo
         k3v5e2LwlgiGP9p+4XqzAp8KDtmctUfned7hn2/7xDBqctMwguo5bNTb7SHuawnmnbnF
         x8pF4uGVrg/1y4fAx3UOzKxpf6rOhWytgGpUCWac+6fiYL4a591DjpTZe/bJUZ4UtRfn
         ewpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780490833; x=1781095633;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8IHtiFTYRJaSwK/lgA40BX6+K7NCg68jEs/RoM3v8w=;
        b=FTpCu5PTXhUnwfQhGCZL9NyTVenuqTpS5KYC1Iz/ET4o9auCzVZnIubJ9GWELdD8Nn
         s48Iz0AAeMV9HGPIRQy1NLFZKS6VACCs7akC4q9tV+ec05YVvbk7orFlhjKA3xo9a+Eh
         y5irjTKxsK8c583+cFrRX/ULuqkBEhXOGtZFVkf02V/OkziotTqZXQyE1722ZB2rYh8t
         NXSVa6Qm0rTJhTCQFtTbvlE04y54vrf2GeNdvhQ8Qemgy34KjOkWBt6qAY1Qz5K70MMP
         r/DJIkTGWn/5ir2XmsFgucBN1bKUODvLKEzulxoMLorAWfsTzMb3xt/eFXA2sWKRS+f0
         igNg==
X-Forwarded-Encrypted: i=1; AFNElJ9i7hdEijak43ukrNU/TAK/PgcEu/AdBabgg8Ndo4Kusc9ozzA5Exn0vZQ7rzfKBv3ecCJnzQsXOqDa@vger.kernel.org
X-Gm-Message-State: AOJu0YwT83fOuxio2vsnjrMYO7gL7RojB28ieZa6jiZzqSLv+E3Wogpu
	gM2/NeRQGAH0u0ZI0UR5AFfGNqyqB4S3WX37l53hJLZ3L7QEVh20JU6bRyrVF1i5bXc=
X-Gm-Gg: Acq92OGDoVV/rY6QELGq6BtYcYW6sXSCfYKl7TUIA/eS4kW4LZHUNBWVLRG1BL1/Edy
	uPmTXJM/WGwCkdIkI8lRb9mSsvnKqrk/J1oqKllZGg6Wc3H0YBgpKGt9yfLcgxv25Fh8EEIFReT
	TPKSKXsky8dMPWUFgQJj1TRup93M+4Ch6BMV5sg1IzX79v6PWQzoQfcengJRwrTvKMmKPJ2K0GS
	oc+LlWYUSSKpaKWt3ZG05f3EFiB3WSqzQ1nKZ73HjOtC2pkG1v+wATfugilgpXn/zXx9k+6Gu8F
	WAJr71WSnEADE7k4Q3XHDv/AgHyxYLDl6JPH8zRkQrg1Ubw8uVmL66DsjXlXmMThf9+MXjbo8fQ
	wrB5JGcgqz2nu56BhY7UeyVzL08OAGo6m0OvOA0cOfgyg/FDoVu0RYMqA15KIjzYHlkp/4qmMa1
	MUfNtdSRnPptf+8QFybVGSMsOG1xpSLVS98jPiJoOAH4zKIdk=
X-Received: by 2002:a17:907:d8b:b0:beb:3dd8:f896 with SMTP id a640c23a62f3a-bf0ae9fc852mr160451566b.34.1780490833586;
        Wed, 03 Jun 2026 05:47:13 -0700 (PDT)
Received: from cloudflare.com ([104.28.21.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051770c7csm151899166b.12.2026.06.03.05.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:47:13 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net,  netdev@vger.kernel.org,  edumazet@google.com,
  pabeni@redhat.com,  andrew+netdev@lunn.ch,  horms@kernel.org,
  maxime.chevallier@bootlin.com,  nb@tipi-net.de,  lee@kernel.org,
  linux-leds@vger.kernel.org,  pavel@kernel.org,  jv@jvosburgh.net,
  michael.chan@broadcom.com,  jhs@mojatatu.com,  vinicius.gomes@intel.com,
  idosch@nvidia.com,  razor@blackwall.org,  hare@suse.de,
  jhasan@marvell.com,  danieller@nvidia.com
Subject: Re: [PATCH net-next v2 03/11] net: document NETDEV_CHANGENAME as
 ops locked
In-Reply-To: <20260603012840.2254293-4-kuba@kernel.org> (Jakub Kicinski's
	message of "Tue, 2 Jun 2026 18:28:32 -0700")
References: <20260603012840.2254293-1-kuba@kernel.org>
	<20260603012840.2254293-4-kuba@kernel.org>
Date: Wed, 03 Jun 2026 14:47:12 +0200
Message-ID: <87v7bz4wq7.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 02, 2026 at 06:28 PM -07, Jakub Kicinski wrote:
> NETDEV_CHANGENAME is only emitted from netif_change_name().
> netif_change_name() has two callers both of which hold netdev_lock_ops()
> around the call site:
>  - dev_change_name()
>  - do_setlink()
>
> Document NETDEV_CHANGENAME as always ops locked.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
