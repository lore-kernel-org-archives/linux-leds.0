Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF0E2D7DDD;
	Sat, 17 Oct 2026 07:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792221485; cv=none; b=d+zVri0YRdHjwX/vbIeoN06L8hbBolmpPet6Rjw5/WUISltWs+YrxIPo/e7fDVqRlWJe+jlC9J69EyKY7E6o1RIBJs/ejSVcjPXkQ/fa2tY8AwLY5OftJHndwZ4pQBJroGYUaPzRcix5DE7cKmsSWm1Ej/ZRNhwEo08EA8iGZwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792221485; c=relaxed/simple;
	bh=asRSgjVyeZBEcfRyCLv347Alu3d+Q3P2vO0cQG6A4OA=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=nvGmORSbXGp1+e8StFqmMWixgoGN9Z3WLG/4c+kQXwslGBHJo8MIEbRpEstjuAtYRzHHB60ou6l1grSe6dZGlgdEbY49to1pPlWWampMmmMf4MxgdqECE1p0kjEzheblXhqaSCwXm4ZGeeCxtG6hXqRJTpSfKKjo3a2YqC5wu4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZX4ZR6Sa; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZX4ZR6Sa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=asRSgjVyeZBEcfRyCLv347Alu3d+Q3P2vO0cQG6A4OA=; b=Z
	X4ZR6Sa1TuXn9fNn+wj5rra69snXdzoVRvzz5fQLgTidJmhgcri9pquqooTDFOmA
	8CfaHgDqLd9irSZ9hbQmeZtIAibfDtAwQc+Rpn1/N0JCnlHzzTI4P+1ew2kwKyx2
	JTDgvHlUCN0gXIf0rz/SorpZfMr7JxLeneqmbb5etg=
Date: Sat, 17 Oct 2026 15:16:49 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Matthias Fend" <matthias.fend@emfend.at>, "Lee Jones" <lee@kernel.org>,
	"Pavel Machek" <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:[PATCH 1/2] leds: tps6131x: queue torch refresh work on
 freezable workqueue
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016100435.2581303-2-yaojiale02@163.com>
References: <20261016100435.2581303-1-yaojiale02@163.com>
 <20261016100435.2581303-2-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6Zvkwr7yiQY+kdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JHB6oQjzTHxgaIQcNGToA3rA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <486f9b25.176b.1a148b8726b.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgDXn7TiINNqL_paAA--.136W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQLPCmrTIOLgNQAA3k
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xNiAxODowNDozNCwgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5UaGUgdG9yY2ggd2F0Y2hkb2cgcmVmcmVzaCB3b3JrIHBlcmZvcm1zIEkyQyByZWdp
c3RlciB3cml0ZXMgYW5kCj5yZXNjaGVkdWxlcyBpdHNlbGYgZXZlcnkgdGVuIHNlY29uZHMgd2hp
bGUgdGhlIHRvcmNoIGlzIGVuYWJsZWQuIFNpbmNlCj5zY2hlZHVsZV9kZWxheWVkX3dvcmsoKSB1
c2VzIHRoZSBub24tZnJlZXphYmxlIHN5c3RlbSB3b3JrcXVldWUsIHRoZQo+Y2FsbGJhY2sgY2Fu
IHJ1biBhZnRlciB0aGUgSTJDIGFkYXB0ZXIgaGFzIGJlZW4gc3VzcGVuZGVkLgo+Cj5RdWV1ZSB0
aGUgcmVmcmVzaCBvbiBzeXN0ZW1fZnJlZXphYmxlX3dxIHNvIGl0IGlzIGZyb3plbiBiZWZvcmUg
ZGV2aWNlcwo+YXJlIHN1c3BlbmRlZCBhbmQgcmVzdW1lZCBvbmx5IGFmdGVyIHRoZXkgYmVjb21l
IGF2YWlsYWJsZSBhZ2Fpbi4KPgoKRml4ZXM6IGIzMzhhMmFlOWIzMSAoImxlZHM6IHRwczYxMzF4
OiBBZGQgc3VwcG9ydCBmb3IgVGV4YXMgSW5zdHJ1bWVudHMgVFBTNjEzMVggZmxhc2ggTEVEIGRy
aXZlciIpCgo+U2lnbmVkLW9mZi1ieTogSmlhbGUgWWFvIDx5YW9qaWFsZTAyQDE2My5jb20+Cj4t
LS0KPiBkcml2ZXJzL2xlZHMvZmxhc2gvbGVkcy10cHM2MTMxeC5jIHwgMTEgKysrKysrKy0tLS0K
PiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj5kaWZm
IC0tZ2l0IGEvZHJpdmVycy9sZWRzL2ZsYXNoL2xlZHMtdHBzNjEzMXguYyBiL2RyaXZlcnMvbGVk
cy9mbGFzaC9sZWRzLXRwczYxMzF4LmMKPmluZGV4IDVjOWE1YWY1YWYwNS4uODQxYTY1MzhlNzVl
IDEwMDY0NAo+LS0tIGEvZHJpdmVycy9sZWRzL2ZsYXNoL2xlZHMtdHBzNjEzMXguYwo+KysrIGIv
ZHJpdmVycy9sZWRzL2ZsYXNoL2xlZHMtdHBzNjEzMXguYwo+QEAgLTExLDYgKzExLDcgQEAKPiAj
aW5jbHVkZSA8bGludXgvbGVkcy5oPgo+ICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiAjaW5j
bHVkZSA8bGludXgvcmVnbWFwLmg+Cj4rI2luY2x1ZGUgPGxpbnV4L3dvcmtxdWV1ZS5oPgo+ICNp
bmNsdWRlIDxtZWRpYS92NGwyLWZsYXNoLWxlZC1jbGFzcy5oPgo+IAo+ICNkZWZpbmUgVFBTNjEz
MVhfUkVHXzAJCQkJMHgwMAo+QEAgLTMwNyw4ICszMDgsOSBAQCBzdGF0aWMgdm9pZCB0cHM2MTMx
eF90b3JjaF9yZWZyZXNoX2hhbmRsZXIoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+IAkJcmV0
dXJuOwo+IAl9Cj4gCj4tCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmdHBzNjEzMXgtPnRvcmNoX3Jl
ZnJlc2hfd29yaywKPi0JCQkgICAgICBUUFM2MTMxWF9UT1JDSF9SRUZSRVNIX0lOVEVSVkFMX0pJ
RkZJRVMpOwo+KwlxdWV1ZV9kZWxheWVkX3dvcmsoc3lzdGVtX2ZyZWV6YWJsZV93cSwKPisJCQkg
ICAmdHBzNjEzMXgtPnRvcmNoX3JlZnJlc2hfd29yaywKPisJCQkgICBUUFM2MTMxWF9UT1JDSF9S
RUZSRVNIX0lOVEVSVkFMX0pJRkZJRVMpOwo+IH0KPiAKPiBzdGF0aWMgaW50IHRwczYxMzF4X2Jy
aWdodG5lc3Nfc2V0KHN0cnVjdCBsZWRfY2xhc3NkZXYgKmNkZXYsIGVudW0gbGVkX2JyaWdodG5l
c3MgYnJpZ2h0bmVzcykKPkBAIC0zNjcsOCArMzY5LDkgQEAgc3RhdGljIGludCB0cHM2MTMxeF9i
cmlnaHRuZXNzX3NldChzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpjZGV2LCBlbnVtIGxlZF9icmlnaHRu
ZXMKPiAJICogVG8gcHJldmVudCB0aGlzLCB0aGUgbW9kZSBtdXN0IGJlIHJlZnJlc2hlZCB3aXRo
aW4gdGhlIHdhdGNoZG9nIHRpbWVvdXQuCj4gCSAqLwo+IAlpZiAoYnJpZ2h0bmVzcykKPi0JCXNj
aGVkdWxlX2RlbGF5ZWRfd29yaygmdHBzNjEzMXgtPnRvcmNoX3JlZnJlc2hfd29yaywKPi0JCQkJ
ICAgICAgVFBTNjEzMVhfVE9SQ0hfUkVGUkVTSF9JTlRFUlZBTF9KSUZGSUVTKTsKPisJCXF1ZXVl
X2RlbGF5ZWRfd29yayhzeXN0ZW1fZnJlZXphYmxlX3dxLAo+KwkJCQkgICAmdHBzNjEzMXgtPnRv
cmNoX3JlZnJlc2hfd29yaywKPisJCQkJICAgVFBTNjEzMVhfVE9SQ0hfUkVGUkVTSF9JTlRFUlZB
TF9KSUZGSUVTKTsKPiAKPiAJcmV0dXJuIDA7Cj4gfQo+LS0gCj4yLjM0LjEK
