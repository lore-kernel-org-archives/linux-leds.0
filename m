Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232A633A029
	for <linux-leds@vger.kernel.org>; Thu, 13 Aug 2026 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635989; cv=none; b=LmaFSAczCAHZay1qXJVda0F9xmo+YpIXHVXojTcAOgm+dkPQ6K/mcdgcxQagO/eyu2Acmu/ZyyFtVb6m4WuBPncLIFUfaquOjSt+pFn2vbv2RVIQvZYZEHDWKxO+US3Si550n+pEufAUC2xcmy6XE7VJm37Yg7Sp/RhgHpgPelY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635989; c=relaxed/simple;
	bh=7fuOQlxqnyazLPRaz5KyfLEM5IqOE9pNwDkbtWOAHlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wy7q2IaxDZLdixoxQvp32alavH+kj/UJFcNw+sO9bGNAc9RMUfL5xC8PF1LC5jV6CyQcOgVusPC0kQnSP0KDHS8Sh3tDBo8MEawNOwv9it/UdrvYDCzvm13abqQUTV8w3yQvxSrmyqc6e5o3HcsY/H3bpieuoLE4RAKh1HJSL7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hI7WNsaG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hI7WNsaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786635984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rWep3q0kXPXu0YRgkQPOVzdYzizOATZDTvCeLKiwHLg=;
	b=hI7WNsaGCjJ69qBmaQvv+VNuSBPtJl8k9C+EKXoOMgVErT++tHzLTky0adsM9SMd5ydm4C
	RCxuVVNjfP0TEMylywnVAgGiwIT8gOeOWqN88uOIIyD4hpdOvdIsmjaznNJ+Eh4EdazaMb
	txHL1lvOKUNmvrZb5NodcWsFq7Iyfwg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-489-lkwrDrRJMluvAouRF6DRWw-1; Thu,
 13 Aug 2026 11:46:21 -0400
X-MC-Unique: lkwrDrRJMluvAouRF6DRWw-1
X-Mimecast-MFC-AGG-ID: lkwrDrRJMluvAouRF6DRWw_1786635979
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A8A19195605E;
	Thu, 13 Aug 2026 15:46:19 +0000 (UTC)
Received: from firien.redhat.com (unknown [10.22.81.86])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 79AD2180049F;
	Thu, 13 Aug 2026 15:46:18 +0000 (UTC)
From: Steve Dunnagan <sdunnaga@redhat.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: gpio: Clear error pointers for skipped LEDs
Date: Thu, 13 Aug 2026 11:45:59 -0400
Message-ID: <20260813154559.2407-1-sdunnaga@redhat.com>
In-Reply-To: <20260724180412.43150-1-sdunnaga@redhat.com>
References: <20260710150841.19669-1-sdunnaga@redhat.com> <20260724180412.43150-1-sdunnaga@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hi Lee, Pavel,

Just checking whether anything else is needed for this v2.

Linus Walleij replied with:

  Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks,
Steve

